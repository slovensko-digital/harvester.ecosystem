require 'rails_helper'

RSpec.describe Itms::SyncDiscrepancyJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs first-level attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/nezrovnalost/1')
          .and_return(itms_file_fixture('nezrovnalost_item.json'))

      subject.perform(1, downloader: downloader)

      expect(Itms::Discrepancy.first).to have_attributes(
        celkova_suma_nezrovnalosti: 23.68,
        celkova_suma_nezrovnalosti_zdroj_eu: 20.13,
        celkova_suma_nezrovnalosti_zdroj_pr: nil,
        celkova_suma_nezrovnalosti_zdroj_sr: 3.55,
        datum_prvej_informacie: DateTime.parse('2016-03-02T00:00:00Z'),
        datum_zistenia: DateTime.parse('2016-01-19T00:00:00Z'),
        dopad_na_rozpocet_eu: 'S_DOPADOM_NA_ROZPOCET_EU',
        druh_nezrovnalosti: 'INDIVIDUALNA_NEZROVNALOST',
        je_systemova: false,
        kod: '312IP160001',
        penale: nil,
        pokuty: nil,
        popis: 'KU porušil dohodu s ÚPSVR, na základe čoho vznikli neoprávnené výdavky',
        pouzite_praktiky: nil,
        projekt_v_priprave_alebo_nerealizovany: nil,
        stanovisko_dlznika: 'prijímateľ oznámil neoprávnené výdavky RO',
        stanovisko_organu: 'RO na základe oznámenia zaevidoval N',
        stav: 'Vysporiadaná',
        suma_na_vymahanie: 23.68,
        suma_na_vymahanie_zdroj_eu: 20.13,
        suma_na_vymahanie_zdroj_pr: nil,
        suma_na_vymahanie_zdroj_sr: 3.55,
        vratena_suma: 23.68,
        vratena_suma_zdroj_eu: 20.13,
        vratena_suma_zdroj_pr: nil,
        vratena_suma_zdroj_sr: 3.55,

        itms_href: '/v2/nezrovnalost/1',
        itms_id: 1,
        itms_created_at: DateTime.parse('2016-05-26T14:19:38.598Z'),
        itms_updated_at: DateTime.parse('2016-12-01T00:00:00Z'),
      )
    end

    pending 'syncs second-level and 1-to-M attributes' do
      expect(Itms::Discrepancy.first).to respond_to(
       :administrativny_stav,
       :dlznik,
       :financny_stav,
       :hlavny_typ_nezrovnalosti,
       :konkretny_ciel,
       :operacny_program,
       :prioritna_os,
       :projekt,
       :subjekty_ktore_sposobili_nezrovnalost,
       :subjekty_ktore_zistili_nezrovnalost,
       :subjekty_zodpovedne_za_nasledne_konanie,
       :suvisiace_nezrovnalosti,
       :suvisiace_pohladavkove_doklady,
       :suvisiace_verejne_obstaravania,
       :suvisiace_zop,
       :typy_nezrovnalosti,
      )
    end
  end
end
