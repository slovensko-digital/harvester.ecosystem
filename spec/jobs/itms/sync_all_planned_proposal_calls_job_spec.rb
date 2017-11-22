require 'rails_helper'

RSpec.describe Itms::SyncAllPlannedProposalCallsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all planned proposal calls' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/vyzvy/planovane')
          .and_return(double(body: itms_file_fixture('vyzva_planovana_list.json')))

      subject.perform(downloader: downloader)

      expect(Itms::SyncPlannedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/planovane/1')
      expect(Itms::SyncPlannedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/planovane/2')
      expect(Itms::SyncPlannedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/planovane/3')
    end
  end
end
