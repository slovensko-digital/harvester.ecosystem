require 'rails_helper'

RSpec.describe Itms::SyncProjectActivityJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/aktivita/122')
          .and_return(double(body: itms_file_fixture('aktivita_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/subjekty/'))
          .and_return(double(body: itms_file_fixture('subjekt_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/typyAktivit/'))
          .and_return(double(body: itms_file_fixture('typ_aktivity_item.json')))

      subject.perform('/v2/aktivita/122', downloader: downloader)

      expect(Itms::ProjectActivity.first).to have_attributes(
        itms_id: 122,
        itms_href: '/v2/aktivita/122',

        datum_konca_planovany: DateTime.parse('2018-06-01T00:00:00Z'),
        datum_konca_skutocny: DateTime.parse('2015-09-07T00:00:00Z'),
        datum_zaciatku_planovany: DateTime.parse('2017-01-01T00:00:00Z'),
        datum_zaciatku_skutocny: DateTime.parse('2015-09-07T00:00:00Z'),
        kod: '217A01900002',
        nazov: 'Čistiareň odpadových vôd',
        subjekt: Itms::Subject.find_by!(itms_id: 100062),
        typ_aktivity: Itms::ActivityType.find_by!(itms_id: 217),
      )
    end
  end
end
