require 'rails_helper'

RSpec.describe Itms::SyncActivityJob, type: :job do
  include_context "itms_downloader"

  describe '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
        .to receive(:get_json_from_href)
        .with('/v2/aktivita/122')
        .and_return(itms_json_fixture('aktivita_item.json'))

      subject.perform('/v2/aktivita/122', downloader: downloader)

      expect(Itms::Activity.first).to have_attributes(
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

    it 'destroys the record if its href returns 404' do
      Itms::Activity.create!(itms_id: 1, itms_href: '/v2/aktivita/1')

      expect(downloader)
        .to receive(:get_json_from_href)
        .with('/v2/aktivita/1')
        .and_raise(ItmsJob::Downloader::NotFoundError)

      expect { subject.perform('/v2/aktivita/1', downloader: downloader) }
        .to change { Itms::Activity.count }.by(-1)
    end
  end
end
