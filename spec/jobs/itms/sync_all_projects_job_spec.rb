require 'rails_helper'

RSpec.describe Itms::SyncAllProjectsJob, type: :job do
  let(:downloader) { double(:downloader) }
  let(:sync_job) { class_double(Itms::SyncProjectJob) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all projects' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with(include('/v2/projekty/ukoncene'), modifiedSince: nil)
          .and_return(itms_json_fixture('projekty_ukoncene_list.json'))
          .at_least(:once)

      expect(downloader)
          .to receive(:get_json_from_href)
          .with(include('/v2/projekty/vrealizacii'), modifiedSince: nil)
          .and_return(itms_json_fixture('projekty_vrealizacii_list.json'))
          .at_least(:once)

      subject.perform(downloader: downloader)

      expect(Itms::SyncProjectJob).to have_been_enqueued.with('/v2/projekty/ukoncene/31')
      expect(Itms::SyncProjectJob).to have_been_enqueued.with('/v2/projekty/ukoncene/60')
      expect(Itms::SyncProjectJob).to have_been_enqueued.with('/v2/projekty/vrealizacii/1')
      expect(Itms::SyncProjectJob).to have_been_enqueued.with('/v2/projekty/vrealizacii/2')
    end
  end
end
