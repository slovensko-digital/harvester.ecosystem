require 'rails_helper'

RSpec.describe Itms::SyncAllDiscrepanciesJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all projects' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/nezrovnalost')
          .and_return(double(body: itms_file_fixture('nezrovnalost_list.json')))

      subject.perform(downloader: downloader)

      expect(Itms::SyncDiscrepancyJob).to have_been_enqueued.exactly(218).times
      expect(Itms::SyncDiscrepancyJob).to have_been_enqueued.with('/v2/nezrovnalost/1')
    end
  end
end
