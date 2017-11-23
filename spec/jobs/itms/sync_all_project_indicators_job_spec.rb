require 'rails_helper'

RSpec.describe Itms::SyncAllProjectIndicatorsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all project_indicators' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/projektovyUkazovatel')
          .and_return(itms_json_fixture('projektovy_ukazovatel_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncProjectIndicatorJob).to have_been_enqueued.exactly(854).times
      expect(Itms::SyncProjectIndicatorJob).to have_been_enqueued.with('/v2/projektovyUkazovatel/1')
    end
  end
end
