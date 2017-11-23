require 'rails_helper'

RSpec.describe Itms::SyncPaymentClaimJob, type: :job do
  include_context 'itms_downloader'
  let(:payment_claim) { Itms::PaymentClaim.find_by!(itms_id: 123) }

  context '#perform' do
    def expect_submitted_attributes(payment_claim)
      expect(payment_claim).to have_attributes(
        itms_id: 123,
        itms_created_at: DateTime.parse('2016-04-27T09:49:30.26Z'),
        itms_updated_at: DateTime.parse('2016-12-13T15:31:38.975Z'),

        datum_prijatia: DateTime.parse('2016-05-09T00:00:00Z'),
        hlavny_cehranicny_partner: Itms::Subject.find_by!(itms_id: 100004),
        kod: "311071A268300101",
        narokovana_suma: 822394.8,
        predfinancovanie: Itms::PaymentClaim.find_by!(itms_id: 123),
        predkladana_za: Itms::Subject.find_by!(itms_id: 100004),
        predkladana_za_subjekty: [
            Itms::PaymentClaimSubmittingSubject.find_by!(
                plati_sa_priamo_subjektu: false,
                subjekt: Itms::Subject.find_by!(itms_id: 100004),
                typ_subjektu_na_projekte: 'Cupiditate commodi minus.'
            )
        ],
        deklarovane_vydavky: [
            Itms::DeclaredExpense.find_by!(itms_id: 45775),
        ],
        prijimatel: Itms::Subject.find_by!(itms_id: 100004),
        projekt: Itms::Project.find_by!(itms_id: 61),
        typ: "PREDFINANCOVANIE",
        vyplaca_sa_partnerovi: false,
        zop_je_zaverecna: false,
        zop_predlozena_za_viac_subjektov: false,
      )

      expect(payment_claim.deklarovane_vydavky.first).to have_attributes(
        datum_uhrady: DateTime.parse('2017-04-07'),
        dph: 24000,
        druh_vydavku: "BEZNY",
        ekonomicka_klasifikacia: "637001",
        funkcna_klasifikacia: "0360",
        itms_id: 45775,
        id_polozky_dokladu: 1539,
        investicna_akcia_prijimatela: "33323",
        nazov: "Organizácia školení a tréningov",
        polozka_rozpoctu: Itms::BudgetItem.find_by!(itms_id: 356),
        poradove_cislo: 3,
        suma_ziadana_na_preplatenie: 144000,
        typ_vydavku: "INE",
        uctovny_doklad: Itms::AccountingDocument.find_by!(itms_id: 1085),
        verejne_obstaravanie: Itms::Procurement.find_by!(itms_id: 259),
        vyska_bez_dph: 120000,
        zmluva_verejne_obstaravanie: Itms::ProcurementContract.find_by!(itms_id: 75),
        suma_neziadana_na_preplatenie: [
            Itms::DeclaredExpenseUnclaimedSum.find_by!(
                druh_neziadanej_sumy: "INE_DOVODY",
                suma_neziadana: 511872.01.to_d
            )
        ],
      )
    end

    it 'syncs submitted payment claim and all of its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zop/predlozene/123')
          .and_return(itms_json_fixture('zop_predlozena_item.json'))
          .once

      expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zop/uhradene/123')
          .and_return(false)

      expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zop/zamietnute/123')
          .and_return(false)

      subject.perform('/v2/zop/uhradene/123', downloader: downloader)

      expect_submitted_attributes(payment_claim)
      expect(payment_claim).to have_attributes(
         itms_href: '/v2/zop/predlozene/123',
      )
    end

    it 'syncs paid payment claim and all of its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zop/predlozene/123')
          .and_return(itms_json_fixture('zop_predlozena_item.json'))
          .once

      expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zop/uhradene/123')
          .and_return(true)

      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zop/uhradene/123')
          .and_return(itms_json_fixture('zop_uhradena_item.json'))

      expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zop/zamietnute/123')
          .and_return(false)

      subject.perform('/v2/zop/predlozene/123', downloader: downloader)

      expect_submitted_attributes(payment_claim)

      expect(payment_claim).to have_attributes(
        itms_href: '/v2/zop/uhradene/123',
        datum_uhrady: DateTime.parse('2016-12-14T00:00:00Z'),
        schvalena_suma: 822394.8
      )

      expect(payment_claim.deklarovane_vydavky.first).to have_attributes(
        investicna_akcia_pj: '33312',
        suma_neschvalena_na_preplatenie: [
            Itms::DeclaredExpenseUnpaidSum.find_by!(
                druh_neschvalenej_sumy: "INE_DOVODY",
                suma_neschvalena: 511872.01.to_d
            )
        ],
        suma_schvalena_na_preplatenie: 144000,
        )
    end

    it 'syncs rejected payment claim and all of its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zop/predlozene/123')
          .and_return(itms_json_fixture('zop_predlozena_item.json'))
          .once

      expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zop/uhradene/123')
          .and_return(false)

      expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zop/zamietnute/123')
          .and_return(true)

      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zop/zamietnute/123')
          .and_return(itms_json_fixture('zop_zamietnuta_item.json'))

      subject.perform('/v2/zop/zamietnute/123', downloader: downloader)

      expect_submitted_attributes(payment_claim)

      expect(payment_claim).to have_attributes(
        itms_href: '/v2/zop/zamietnute/123',
        datum_zamietnutia: DateTime.parse('2016-02-17T13:43:26.732Z'),
        stav_zamietnutej_zop: 'Stiahnutá prijímateľom (K)'
      )
    end

    pending 'attributes with lacking examples' do
      expect(Itms::PaymentClaim.first).to respond_to(
        :predkladana_za_subjekty,
      )
    end
  end
end
