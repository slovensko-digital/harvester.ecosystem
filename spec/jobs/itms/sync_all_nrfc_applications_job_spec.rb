require 'rails_helper'

RSpec.describe Itms::SyncAllNrfcApplicationsJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all announced proposal calls' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zonfp/prijate')
          .and_return(itms_json_fixture('zonfp_prijata_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncNrfcApplicationJob).to have_been_enqueued.with('/v2/zonfp/prijate/1')
      expect(Itms::SyncNrfcApplicationJob).to have_been_enqueued.with('/v2/zonfp/prijate/2')
      expect(Itms::SyncNrfcApplicationJob).to have_been_enqueued.with('/v2/zonfp/prijate/3')
    end
  end
end
