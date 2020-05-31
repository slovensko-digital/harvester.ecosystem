require 'rails_helper'

RSpec.describe Itms::SyncAllPriorityAxesJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all specific goals' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/operacneProgramy')
          .and_return(itms_json_fixture('operacny_program_list.json'))
          .once

      expect(downloader)
          .to receive(:get_json_from_href)
          .with(/\/v2\/operacneProgramy\/\d+\/prioritneOsi$/)
          .and_return(itms_json_fixture('prioritna_os_list.json'))
          .exactly(10).times

      subject.perform(downloader: downloader)

      expect(Itms::SyncPriorityAxisJob).to have_been_enqueued.exactly(10 * 5).times
      expect(Itms::SyncPriorityAxisJob).to have_been_enqueued.with('/v2/prioritnaOs/8').at_least(:once)
      expect(Itms::SyncPriorityAxisJob).to have_been_enqueued.with('/v2/prioritnaOs/9').at_least(:once)
      expect(Itms::SyncPriorityAxisJob).to have_been_enqueued.with('/v2/prioritnaOs/10').at_least(:once)
    end
  end
end
