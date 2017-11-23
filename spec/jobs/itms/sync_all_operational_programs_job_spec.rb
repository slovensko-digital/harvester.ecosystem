require 'rails_helper'

RSpec.describe Itms::SyncAllOperationalProgramsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all operational programs' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/operacneProgramy')
          .and_return(itms_json_fixture('operacny_program_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncOperationalProgramJob).to have_been_enqueued.exactly(10).times
      expect(Itms::SyncOperationalProgramJob).to have_been_enqueued.with('/v2/operacneProgramy/1')
    end
  end
end
