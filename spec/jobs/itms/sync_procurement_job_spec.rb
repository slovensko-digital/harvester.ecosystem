require 'rails_helper'

RSpec.describe Itms::SyncProcurementJob, type: :job do
  include_context "itms_downloader"

  context '#perform' do
    it 'syncs procurement and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/verejneObstaravania/2')
          .and_return(double(body: itms_file_fixture('verejne_obstaravanie_item.json')))
          .once

      subject.perform('/v2/verejneObstaravania/2', downloader: downloader)

      expect(Itms::Procurement.first).to have_attributes(
        itms_id: 2,
        itms_href: '/v2/verejneObstaravania/2',
        itms_created_at: DateTime.parse('2015-11-23T19:25:28.679Z'),
        itms_updated_at: DateTime.parse('2016-11-14T11:22:23.307Z'),

        centralne_obstaravanie: false,
        cislo_vestnika: '39/2014',
        cislo_zverejnenia_vo_vestniku: '2506-WYP',
        datum_zverejnenia_vo_vestniku: DateTime.parse('2014-02-25T00:00:00Z'),
        doplnujuce_predmety_doplnkovy_slovnik: [
            Itms::CodelistValue.where_codelist_and_value(1049, 6941).first!,
        ],
        doplnujuce_predmety_hlavny_slovnik: [
            Itms::CodelistValue.where_codelist_and_value(1049, 6940).first!,
        ],
        druh_zakazky: Itms::CodelistValue.where_codelist_and_value(1048, 3).first!,
        hlavny_predmet_doplnkovy_slovnik: [
            Itms::CodelistValue.where_codelist_and_value(1049, 6905).first!,
            Itms::CodelistValue.where_codelist_and_value(1049, 6906).first!,
        ],
        hlavny_predmet_hlavny_slovnik: Itms::CodelistValue.where_codelist_and_value(1049, 6902).first!,
        kod: 'VO66152197',
        kriterium_na_vyhodnotenie_ponuk: 'NAJNIZSIA_CENA',
        lehota_na_predkladanie_ponuk: DateTime.parse('2014-03-14T09:30:00Z'),
        lehota_na_predkladanie_ziadosti_o_ucast: DateTime.parse('2014-03-14T09:30:00Z'),
        metoda_vo: Itms::CodelistValue.where_codelist_and_value(1041, 2).first!,
        nazov: 'Rozšírenie kapacity ČOV Lozorno',
        obmedzenie_poctu_uchadzacov: false,
        obstaravatel_dodavatel_obstaravatel: Itms::Supplier.find_by!(itms_id: 229),
        obstaravatel_subjekt: Itms::Subject.find_by!(itms_id: 100184),
        operacne_programy: [
            Itms::OperationalProgram.find_by!(itms_id: 1)
        ],
        pocet_prijatych_ponuk: 3,
        pocet_vylucenych_ponuk: 0,
        postup_obstaravania: Itms::CodelistValue.where_codelist_and_value(1042, 9).first!,
        predchadzajuce_oznamenie: false,
        predpokladana_hodnota_zakazky: 328405.to_d,
        projekty: [
            Itms::Project.find_by!(itms_id: 70)
        ],
        stav: 'Ukončené',
        trvanie_zakazky_hodnota: 2.to_d,
        trvanie_zakazky_merna_jednotka: 'MESIAC',
        uctovne_doklady: [
            Itms::AccountingDocument.find_by!(itms_id: 3172)
        ],
        url_odkaz_oznamenie: 'https://www2.uvo.gov.sk/evestnik/-/vestnik/234016',
        zadavanie_zakazky_v_mene_inych_obstaravatelov: false,
        zadavatel: Itms::Subject.find_by!(itms_id: 100184),
        zakazka_rozdelena_na_viac_casti: false,
        zverejnene_vo_vestniku_eu: false,
      )
    end
  end
end
