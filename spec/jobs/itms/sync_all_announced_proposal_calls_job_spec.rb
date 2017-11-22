require 'rails_helper'

RSpec.describe Itms::SyncAllAnnouncedProposalCallsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all announced proposal calls' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/vyzvy/vyhlasene')
          .and_return(double(body: itms_file_fixture('vyzva_vyhlasena_list.json')))

      subject.perform(downloader: downloader)

      expect(Itms::SyncAnnouncedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/vyhlasene/1')
      expect(Itms::SyncAnnouncedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/vyhlasene/2')
      expect(Itms::SyncAnnouncedProposalCallJob).to have_been_enqueued.with('/v2/vyzvy/vyhlasene/3')
    end
  end
end
