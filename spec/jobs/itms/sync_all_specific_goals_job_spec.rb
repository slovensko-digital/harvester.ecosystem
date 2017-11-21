require 'rails_helper'

RSpec.describe Itms::SyncAllSpecificGoalsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all specific goals' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/operacneProgramy')
          .and_return(double(body: itms_file_fixture('operacny_program_list.json')))
          .once

      expect(downloader)
          .to receive(:get)
          .with(/\/v2\/operacneProgramy\/\d+\/prioritneOsi$/)
          .and_return(double(body: itms_file_fixture('prioritna_os_list.json')))
          .exactly(10).times

      expect(downloader)
          .to receive(:get)
          .with(/\/v2\/prioritnaOs\/\d+\/konkretneCiele$/)
          .and_return(double(body: itms_file_fixture('konkretny_ciel_list.json')))
          .exactly(10 * 5).times

      subject.perform(downloader: downloader)

      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.exactly(10 * 5 * 7).times
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/1').at_least(:once)
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/2').at_least(:once)
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/3').at_least(:once)
    end
  end
end
