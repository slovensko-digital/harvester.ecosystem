require 'rails_helper'

RSpec.describe Itms::SyncDiscrepancyJob, type: :job do
  include_context "itms_downloader"

  context '#perform' do
    it 'syncs discrepancy and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/nezrovnalost/1')
          .and_return(double(body: itms_file_fixture('nezrovnalost_item.json')))
          .at_least(:once)

      subject.perform(1, downloader: downloader)

      expect(Itms::Discrepancy.first).to have_attributes(
        itms_id: 1,
        itms_href: '/v2/nezrovnalost/1',
        itms_created_at: DateTime.parse('2016-05-26T14:19:38.598Z'),
        itms_updated_at: DateTime.parse('2016-12-01T00:00:00Z'),

        administrativny_stav: Itms::CodelistValue.where_codelist_and_value(1063, 5).first!,
        celkova_suma_nezrovnalosti: 23.68,
        celkova_suma_nezrovnalosti_zdroj_eu: 20.13,
        celkova_suma_nezrovnalosti_zdroj_pr: nil,
        celkova_suma_nezrovnalosti_zdroj_sr: 3.55,
        datum_prvej_informacie: DateTime.parse('2016-03-02T00:00:00Z'),
        datum_zistenia: DateTime.parse('2016-01-19T00:00:00Z'),
        dlznik: Itms::Subject.find_by!(itms_id: 100077),
        dopad_na_rozpocet_eu: 'S_DOPADOM_NA_ROZPOCET_EU',
        druh_nezrovnalosti: 'INDIVIDUALNA_NEZROVNALOST',
        financny_stav: Itms::CodelistValue.where_codelist_and_value(1067, 7).first!,
        hlavny_typ_nezrovnalosti: Itms::CodelistValue.where_codelist_and_value(1075, 113).first!,
        je_systemova: false,
        kod: '312IP160001',
        konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 8),
        operacny_program: Itms::OperationalProgram.find_by!(itms_id: 4),
        penale: nil,
        pokuty: nil,
        popis: 'KU porušil dohodu s ÚPSVR, na základe čoho vznikli neoprávnené výdavky',
        pouzite_praktiky: nil,
        prioritna_os: Itms::PriorityAxis.find_by!(itms_id: 8),
        projekt: Itms::Project.find_by!(itms_id: 4),
        projekt_v_priprave_alebo_nerealizovany: nil,
        stanovisko_dlznika: 'prijímateľ oznámil neoprávnené výdavky RO',
        stanovisko_organu: 'RO na základe oznámenia zaevidoval N',
        stav: 'Vysporiadaná',
        subjekty_ktore_sposobili_nezrovnalost: [],
        subjekty_ktore_zistili_nezrovnalost: [Itms::Subject.find_by!(itms_id: 100003)],
        subjekty_zodpovedne_za_nasledne_konanie: [Itms::Subject.find_by!(itms_id: 100003)],
        suma_na_vymahanie: 23.68,
        suma_na_vymahanie_zdroj_eu: 20.13,
        suma_na_vymahanie_zdroj_pr: nil,
        suma_na_vymahanie_zdroj_sr: 3.55,
        suvisiace_nezrovnalosti: [Itms::Discrepancy.find_by!(itms_id: 3)],
        suvisiace_pohladavkove_doklady: [Itms::AccountsReceivableDocument.find_by!(itms_id: 2)],
        suvisiace_verejne_obstaravania: [Itms::Procurement.find_by!(itms_id: 219)],
        suvisiace_zop: [Itms::PaymentClaim.find_by!(itms_id: 123)],
        typy_nezrovnalosti: [
          Itms::CodelistValue.where_codelist_and_value(1075, 113).first!,
          Itms::CodelistValue.where_codelist_and_value(1075, 105).first!,
        ],
        vratena_suma: 23.68,
        vratena_suma_zdroj_eu: 20.13,
        vratena_suma_zdroj_pr: nil,
        vratena_suma_zdroj_sr: 3.55,
      )
    end
  end
end
