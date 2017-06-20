require 'harvester_utils/downloader'

class Itms::ProcurementsHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/v1/verejneObstaravania?minId=#{min_id}&limit=100")

    json_response.each do |json|
      Itms::Procurement.transaction do
        begin
          procurement = Itms::Procurement.new
          procurement[:itms_identifier] = json['id']
          procurement[:kod] = json['kod']
          procurement[:nazov] = json['nazov']
          procurement[:stav] = json['stav']
          procurement[:pocet_prijatych_ponuk] = json['pocetPrijatychPonuk']
          procurement[:pocet_vylucenych_ponuk] = json['pocetVylucenychPonuk']
          procurement[:predpokladana_hodnota_zakazky] = json['predpokladanaHodnotaZakazky']
          procurement[:cislo_vestnika] = json['cisloVestnika']
          procurement[:cislo_zverejnenia_vo_vestniku] = json['cisloZverejneniaVoVestniku']
          procurement[:created_at] = json['createdAt']
          procurement[:updated_at] = json['updatedAt']
          procurement[:url_odkaz_oznamenie] = json['urlOdkazOznamenie']
          procurement[:zverejnene_vo_vestniku_eu] = json['zverejneneVoVestnikuEU']
          procurement[:datum_zverejnenia_vo_vestniku] = json['datumZverejneniaVoVestniku']

          save_procurement_order_type(json, procurement)
          save_procurement_additional_vocabularies(json, procurement)
          save_procurement_main_vocabulary(json, procurement)
          save_procurement_method_vo(json, procurement)
          save_procurement_factotum(json, procurement)
          save_procurement_operational_programs(json, procurement)
          save_procurement_procedure(json, procurement)
          save_procurement_projects(json, procurement)
          save_procurement_accounting_documents(json, procurement)
          save_procurement_submitter(json, procurement)
        
          procurement.save!
          save_procurement_contract(procurement)
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{procurement.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::Procurement)
  end

  private

  def save_procurement_order_type(json, procurement)
    order_json = json['druhZakazky']
    if order_json.present?
      order_type = procurement.build_procurement_order_type
      order_type[:itms_identifier] = order_json['id']
      order_type[:kod_zdroj] = order_json['kodZdroj']
      order_type[:nazov] = order_json['nazov']
    end
  end

  def save_procurement_additional_vocabularies(json, procurement)
    Array(json['hlavnyPredmetDoplnkovySlovnik']).each do |vocabulary_json|
      vocabulary = procurement.procurement_additional_vocabularies.new
      vocabulary[:itms_identifier] = vocabulary_json['id']
      vocabulary[:kod_zdroj] = vocabulary_json['kodZdroj']
      vocabulary[:nazov] = vocabulary_json['nazov']
    end
  end

  def save_procurement_main_vocabulary(json, procurement)
    main_vocabulary_json = json['hlavnyPredmetHlavnySlovnik']
    if main_vocabulary_json.present?
      main_vocabulary = procurement.build_procurement_main_vocabulary
      main_vocabulary[:itms_identifier] = main_vocabulary_json['id']
      main_vocabulary[:kod_zdroj] = main_vocabulary_json['kodZdroj']
      main_vocabulary[:nazov] = main_vocabulary_json['nazov']
    end
  end

  def save_procurement_method_vo(json, procurement)
    method_vo_json = json['metodaVo']
    if method_vo_json.present?
      method_vo = procurement.build_procurement_method_vo
      method_vo[:itms_identifier] = method_vo_json['id']
      method_vo[:kod_zdroj] = method_vo_json['kodZdroj']
      method_vo[:nazov] = method_vo_json['nazov']
    end
  end

  def save_procurement_factotum(json, procurement)
    factotum_json = json['obstaravatel']
    if factotum_json.present?
      factotum = procurement.build_procurement_factotum
      factotum[:itms_identifier] = factotum_json['id']
      factotum[:ico] = factotum_json['ico']
      factotum[:ine_identifikacne_cislo] = factotum_json['ineIdentifikacneCislo']
    end
  end

  def save_procurement_operational_programs(json, procurement)
    Array(json['operacneProgramy']).each do |program_json|
      program = procurement.procurement_operational_programs.new
      program[:itms_identifier] = program_json['id']
    end
  end

  def save_procurement_procedure(json, procurement)
    procedure_json = json['postupObstaravania']
    if procedure_json.present?
      procedure = procurement.build_procurement_procedure
      procedure[:itms_identifier] = procedure_json['id']
      procedure[:kod_zdroj] = procedure_json['kodZdroj']
      procedure[:nazov] = procedure_json['nazov']
    end
  end

  def save_procurement_projects(json, procurement)
    Array(json['projekty']).each do |project_json|
      project = procurement.procurement_projects.new
      project[:itms_identifier] = project_json['id']
    end
  end

  def save_procurement_accounting_documents(json, procurement)
    Array(json['uctovneDoklady']).each do |document_json|
      document = procurement.procurement_accounting_documents.new
      document[:itms_identifier] = document_json['id']
    end
  end

  def save_procurement_submitter(json, procurement)
    submitter_json = json['zadavatel']
    if submitter_json.present?
      submitter = procurement.build_procurement_submitter
      submitter[:itms_identifier] = submitter_json['id']
      submitter[:ico] = submitter_json['ico']
      submitter[:ine_identifikacne_cislo] = submitter_json['ineIdentifikacneCislo']
    end
  end

  def save_procurement_contract(procurement)
    response = downloader.get("https://opendata.itms2014.sk/v1/verejneObstaravania/#{procurement.itms_identifier}/zmluvyVerejneObstaravanie")
    handle_api_response(response).each do |contract_json|
      contract = Itms::ProcurementContract.find_or_initialize_by(itms_identifier: contract_json['id'])
      contract.procurement_contract_procurement = procurement
      contract[:celkova_suma_zmluvy] = contract_json['celkovaSumaZmluvy']
      contract[:cislo_zmluvy] = contract_json['cisloZmluvy']
      contract[:created_at] = contract_json['createdAt']
      contract[:updated_at] = contract_json['updatedAt']
      contract[:datum_platnosti] = contract_json['datumPlatnosti']
      contract[:datum_ucinnosti] = contract_json['datumUcinnosti']
      contract[:kod] = contract_json['kod']
      contract[:nazov] = contract_json['nazov']
      contract[:predmet_zmluvy] = contract_json['predmetZmluvy']
      contract[:suma_bez_dph] = contract_json['sumaBezDph']
      contract[:url_odkaz_na_zmluvu] = contract_json['urlOdkazNaZmluvu']

      save_contract_another_urls(contract_json, contract)
      save_contract_suppliers(contract_json, contract)
      save_contract_main_supplier(contract_json, contract)

      contract.save!
    end
  end

  def save_contract_another_urls(contract_json, contract)
    Array(contract_json['dalsieUrl']).each do |url_json|
      url = contract.procurement_contract_another_urls.new
      url[:nazov] = url_json['nazov']
      url[:url] = url_json['url']
    end
  end

  def save_contract_suppliers(contract_json, contract)
    Array(contract_json['dodavatelia']).each do |supplier_json|
      supplier = contract.procurement_contract_suppliers.new
      supplier[:je_hlavny_dodavatel] = supplier_json['jeHlavnyDodavatel']
      supplier_unit_json = supplier_json['dodavatel']
      if supplier_unit_json.present?
        supplier_unit = supplier.build_procurement_contract_supplier_supplier
        supplier_unit[:itms_identifier] = supplier_unit_json['id']
        supplier_unit[:ico] = supplier_unit_json['ico']
        supplier_unit[:ine_identifikacne_cislo] = supplier_unit_json['ineIdentifikacneCislo']
        load_and_save_supplier(supplier_unit_json['href'])
      end
    end
  end

  def save_contract_main_supplier(contract_json, contract)
    main_supplier_json = contract_json['hlavnyDodavatel']
    if main_supplier_json.present?
      main_supplier = contract.procurement_contract_main_supplier
      main_supplier ||= contract.build_procurement_contract_main_supplier
      main_supplier[:itms_identifier] = main_supplier_json['id']
      main_supplier[:ico] = main_supplier_json['ico']
      main_supplier[:ine_identifikacne_cislo] = main_supplier_json['ineIdentifikacneCislo']
      load_and_save_supplier(main_supplier_json['href'])
    end
  end
end
