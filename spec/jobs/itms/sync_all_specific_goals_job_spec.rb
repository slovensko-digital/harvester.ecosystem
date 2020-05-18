require 'rails_helper'

RSpec.describe Itms::SyncAllSpecificGoalsJob, type: :job do
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

      expect(downloader)
          .to receive(:get_json_from_href)
          .with(/\/v2\/prioritnaOs\/\d+\/konkretneCiele$/)
          .and_return(itms_json_fixture('konkretny_ciel_list.json'))
          .exactly(10 * 5).times

      subject.perform(downloader: downloader)

      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.exactly(10 * 5 * 7).times
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/1').at_least(:once)
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/2').at_least(:once)
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/3').at_least(:once)
    end
  end
end
