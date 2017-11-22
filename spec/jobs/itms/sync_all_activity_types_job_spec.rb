require 'rails_helper'

RSpec.describe Itms::SyncAllActivityTypesJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all activity types' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/typyAktivit')
          .and_return(double(body: itms_file_fixture('typ_aktivity_list.json')))

      subject.perform(downloader: downloader)

      expect(Itms::SyncActivityTypeJob).to have_been_enqueued.exactly(1455).times
      expect(Itms::SyncActivityTypeJob).to have_been_enqueued.with('/v2/typyAktivit/1')
    end
  end
end