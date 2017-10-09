require 'rails_helper'

RSpec.describe Itms::SyncDiscrepancyJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs discrepancy and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/nezrovnalost/1')
          .and_return(double(body: itms_file_fixture('nezrovnalost_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/subjekty/'))
          .and_return(double(body: itms_file_fixture('subjekt_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/konkretnyCiel/'))
          .and_return(double(body: itms_file_fixture('konkretny_ciel_item.json')))

      subject.perform(1, downloader: downloader)

      expect(Itms::Discrepancy.first).to have_attributes(
        administrativny_stav: Itms::Code.find_by!(kod_id: 5, kod_zdroj: 'PX', nazov: 'Ukončené konanie'),
        celkova_suma_nezrovnalosti: 23.68,
        celkova_suma_nezrovnalosti_zdroj_eu: 20.13,
        celkova_suma_nezrovnalosti_zdroj_pr: nil,
        celkova_suma_nezrovnalosti_zdroj_sr: 3.55,
        datum_prvej_informacie: DateTime.parse('2016-03-02T00:00:00Z'),
        datum_zistenia: DateTime.parse('2016-01-19T00:00:00Z'),
        dlznik: Itms::Subject.find_by!(itms_id: 100077),
        dopad_na_rozpocet_eu: 'S_DOPADOM_NA_ROZPOCET_EU',
        druh_nezrovnalosti: 'INDIVIDUALNA_NEZROVNALOST',
        financny_stav: Itms::Code.find_by!(kod_id: 7, kod_zdroj: 'G-FULR', nazov: 'Vrátené / vymožené v plnej výške'),
        hlavny_typ_nezrovnalosti: Itms::Code.find_by!(kod_id: 113, kod_zdroj: '811', nazov: 'Akcia neukončená'),
        je_systemova: false,
        kod: '312IP160001',
        konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 8),
        # TODO operacny_program: Itms::OperationalProgram.find_by!(itms_identifier: 4),
        penale: nil,
        pokuty: nil,
        popis: 'KU porušil dohodu s ÚPSVR, na základe čoho vznikli neoprávnené výdavky',
        pouzite_praktiky: nil,
        # TODO prioritna_os: Itms::PriorityAxis.find_by!(itms_identifier: 8),
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
       :operacny_program,
       :prioritna_os,
       :projekt,
       :suvisiace_nezrovnalosti,
       :suvisiace_pohladavkove_doklady,
       :suvisiace_verejne_obstaravania,
       :suvisiace_zop,
       :typy_nezrovnalosti,
      )
    end
  end
end