class Itms::SyncPaymentClaimJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      pc = Itms::PaymentClaim.find_or_create_by!(itms_id: itms_id)

      sync_submitted_attributes(pc, downloader)
      sync_paid_attributes(pc, downloader)
      sync_rejected_attributes(pc, downloader)

      pc.save!
    end
  end

  private

  def sync_submitted_attributes(payment_claim, downloader)
    pc = payment_claim
    json = downloader.get_json_from_href("/v2/zop/predlozene/#{pc.itms_id}")

    pc.itms_href = json['href']
    pc.itms_created_at = json['createdAt']
    pc.itms_updated_at = json['updatedAt']
    pc.ekosystem_stav = json['href'].split('/')[3]

    pc.datum_prijatia = json['datumPrijatia']
    pc.hlavny_cehranicny_partner = find_or_create_subject_by_json(json['hlavnyCehranicnyPartner'], downloader)
    pc.kod = json['kod']
    pc.narokovana_suma = json['narokovanaSuma']
    pc.predfinancovanie = find_or_create_payment_claim_by_json(json['predfinancovanie'], downloader)
    pc.predkladana_za = find_or_create_subject_by_json(json['predkladanaZa'], downloader)
    pc.predkladana_za_subjekty = find_or_create_submitting_subjects_by_json(json['predkladanaZaSubjekty'], pc.predkladana_za_subjekty, downloader)
    pc.deklarovane_vydavky = find_or_create_declared_expenses_by_json(json['predlozeneDeklarovaneVydavky'], pc.deklarovane_vydavky, downloader)
    pc.prijimatel = find_or_create_subject_by_json(json['prijimatel'], downloader)
    pc.projekt = find_or_create_project_by_json(json['projekt'], downloader)
    pc.typ = json['typ']
    pc.vyplaca_sa_partnerovi = json['vyplacaSaPartnerovi']
    pc.zop_je_zaverecna = json['zopJeZaverecna']
    pc.zop_predlozena_za_viac_subjektov = json['zopPredlozenaZaViacSubjektov']
  end

  def sync_paid_attributes(payment_claim, downloader)
    pc = payment_claim
    href = "/v2/zop/uhradene/#{pc.itms_id}"
    json = downloader.href_exists?(href) ? downloader.get_json_from_href(href) : {}

    if json.present?
      pc.itms_href = json['href']
      pc.ekosystem_stav = json['href'].split('/')[3]
      pc.deklarovane_vydavky = find_or_create_declared_expenses_by_json(json['schvaleneDeklarovaneVydavky'], pc.deklarovane_vydavky, downloader)
    end

    pc.datum_uhrady = json['datumUhrady']
    pc.schvalena_suma = json['schvalenaSuma']
  end

  def sync_rejected_attributes(payment_claim, downloader)
    pc = payment_claim
    href = "/v2/zop/zamietnute/#{pc.itms_id}"
    json = downloader.href_exists?(href) ? downloader.get_json_from_href(href) : {}

    if json.present?
      pc.itms_href = json['href']
      pc.ekosystem_stav = json['href'].split('/')[3]
    end

    pc.datum_zamietnutia = json['datumZamietnutia']
    pc.stav_zamietnutej_zop = json['stavZamietnutejZop']
  end

  def find_or_create_procurement_contract_by_json(json, procurement, downloader)
    return if json.blank?
    existing_object = Itms::ProcurementContract.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncProcurementContractJob.perform_now(json['href'], procurement, downloader: downloader)
    Itms::ProcurementContract.find_by!(itms_id: json['id'])
  end

  def find_or_create_declared_expenses_by_json(json_list, scope, downloader)
    return [] if json_list.blank?

    json_list.map do |json|
      de = scope.find_or_create_by!(itms_id: json['id'])

      de.datum_uhrady = json['datumUhrady']
      de.dph = json['dph']
      de.druh_vydavku = json['druhVydavku']
      de.ekonomicka_klasifikacia = json['ekonomickaKlasifikacia']
      de.funkcna_klasifikacia = json['funkcnaKlasifikacia']
      de.id_polozky_dokladu = json['idPolozkyDokladu']
      de.investicna_akcia_pj = json['investicnaAkciaPj']
      de.investicna_akcia_prijimatela = json['investicnaAkciaPrijimatela']
      de.nazov = json['nazov']
      de.polozka_rozpoctu = find_or_create_budget_item_by_json(json['polozkaRozpoctu'], downloader)
      de.poradove_cislo = json['poradoveCislo']
      de.suma_neschvalena_na_preplatenie = find_or_create_unpaid_sums_by_json(json['sumaNeschvalenaNaPreplatenie'], de.suma_neschvalena_na_preplatenie)
      de.suma_neziadana_na_preplatenie = find_or_create_unclaimed_sums_by_json(json['sumaNeziadanaNaPreplatenie'], de.suma_neziadana_na_preplatenie)
      de.suma_schvalena_na_preplatenie = json['sumaSchvalenaNaPreplatenie']
      de.suma_ziadana_na_preplatenie = json['sumaZiadanaNaPreplatenie']
      de.typ_vydavku = json['typVydavku']
      de.uctovny_doklad = find_or_create_accounting_document_by_json(json['uctovnyDoklad'], downloader)
      de.verejne_obstaravanie = find_or_create_procurement_by_json(json['verejneObstaravanie'], downloader)
      de.vyska_bez_dph = json['vyskaBezDph']
      de.zmluva_verejne_obstaravanie = find_or_create_procurement_contract_by_json(json['zmluvaVerejneObstaravanie'], de.verejne_obstaravanie, downloader)
      de.save!

      de
    end
  end
  
  def find_or_create_unclaimed_sums_by_json(json_list, scope)
    return [] if json_list.blank?

    json_list.map do |json|
      scope.find_or_create_by!(
          druh_neziadanej_sumy: json['druhNeziadanejSumy'],
          suma_neziadana: json['sumaNeziadana'],
      )
    end
  end

  def find_or_create_unpaid_sums_by_json(json_list, scope)
    return [] if json_list.blank?

    json_list.map do |json|
      scope.find_or_create_by!(
          druh_neschvalenej_sumy: json['druhNeziadanejSumy'],
          suma_neschvalena: json['sumaNeziadana'],
      )
    end
  end

  def find_or_create_submitting_subjects_by_json(json_list, scope, downloader)
    return [] if json_list.blank?

    json_list.map do |json|
      scope.find_or_create_by!(
          plati_sa_priamo_subjektu: json['platiSaPriamoSubjektu'],
          subjekt: find_or_create_subject_by_json(json['subjekt'], downloader),
          typ_subjektu_na_projekte: json['typSubjektuNaProjekte'],
          )
    end
  end
end
