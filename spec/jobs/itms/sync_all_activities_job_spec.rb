require 'rails_helper'

RSpec.describe Itms::SyncAllActivitiesJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all activities' do
      expect(downloader)
        .to receive(:get_json_from_href)
          .with('/v2/aktivita', modifiedSince: nil)
          .and_return(itms_json_fixture('aktivita_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncActivityJob).to have_been_enqueued.exactly(101).times
      expect(Itms::SyncActivityJob).to have_been_enqueued.with('/v2/aktivita/1')
    end
  end
end
