require 'rails_helper'

RSpec.describe Itms::SyncAllPlannedProposalCallsJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all planned proposal calls' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/vyzvy/planovane', modifiedSince: nil)
          .and_return(itms_json_fixture('vyzva_planovana_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncPlannedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/planovane/1')
      expect(Itms::SyncPlannedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/planovane/2')
      expect(Itms::SyncPlannedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/planovane/3')
    end
  end
end
