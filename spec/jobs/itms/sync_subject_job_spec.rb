require 'rails_helper'

RSpec.describe Itms::SyncSubjectJob, type: :job do
  include_context 'itms_downloader'

  context '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/subjekty/100077')
          .and_return(double(body: itms_file_fixture('subjekt_item.json')))

      subject.perform('/v2/subjekty/100077', downloader: downloader)

      expect(Itms::Subject.first).to have_attributes(
        itms_id: 100077,
        itms_href: '/v2/subjekty/100077',
        itms_created_at: DateTime.parse('2015-09-10T12:35:30.615Z'),
        itms_updated_at: DateTime.parse('2017-11-02T08:09:49.713Z'),

        dic: '2021777780',
        ico: '30794536',
        ine_identifikacne_cislo: '41076659',
        nazov: 'Ústredie práce, sociálnych vecí a rodiny',
        obec: Itms::NutsCode.find_by!(
            gps_lat: 48.148598.to_d,
            gps_lon: 17.107747.to_d,
            hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 99).first!
        ),
        psc: '81267',
        stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!,
        typ_ineho_identifikacneho_cisla: Itms::CodelistValue.where_codelist_and_value(1081, 200003).first!,
        ulica: 'Špitálska',
        ulica_cislo: '8',
      )
    end
  end
end
