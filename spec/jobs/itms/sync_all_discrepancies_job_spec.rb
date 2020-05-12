require 'rails_helper'

RSpec.describe Itms::SyncAllDiscrepanciesJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all discrepancies' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/nezrovnalost', modifiedSince: nil)
          .and_return(itms_json_fixture('nezrovnalost_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncDiscrepancyJob).to have_been_enqueued.exactly(218).times
      expect(Itms::SyncDiscrepancyJob).to have_been_enqueued.with('/v2/nezrovnalost/1')
    end
  end
end
