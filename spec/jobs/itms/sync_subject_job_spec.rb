require 'rails_helper'

RSpec.describe Itms::SyncSubjectJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/subjekty/100077')
          .and_return(double(body: itms_file_fixture('subjekt_item.json')))

      subject.perform(100077, downloader: downloader)

      expect(Itms::Subject.first).to have_attributes(
        itms_id: 100077,
        itms_href: '/v2/subjekty/100077',
        itms_created_at: DateTime.parse('2015-09-10T12:35:30.615Z'),
        itms_updated_at: DateTime.parse('2017-06-06T10:32:35.274Z'),

        dic: '2021777780',
        gps_lat: 48.148598,
        gps_lon: 17.107747,
        ico: '30794536',
        ine_identifikacne_cislo: nil,
        nazov: 'Ústredie práce, sociálnych vecí a rodiny',
        obec: 'Bratislava - mestská časť Staré Mesto',
        psc: '81267',
        stat: 'Slovensko',
        typ_ineho_identifikacneho_cisla: nil,
        ulica: 'Špitálska',
        ulica_cislo: '8',
      )
    end
  end
end
