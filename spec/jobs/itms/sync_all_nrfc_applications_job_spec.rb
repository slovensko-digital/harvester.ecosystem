require 'rails_helper'

RSpec.describe Itms::SyncAllNrfcApplicationsJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all announced proposal calls' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zonfp/prijate', modifiedSince: nil)
          .and_return(itms_json_fixture('zonfp_prijata_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncNrfcApplicationJob).to have_been_enqueued.with('/v2/zonfp/prijate/1')
      expect(Itms::SyncNrfcApplicationJob).to have_been_enqueued.with('/v2/zonfp/prijate/2')
      expect(Itms::SyncNrfcApplicationJob).to have_been_enqueued.with('/v2/zonfp/prijate/3')
    end

    it 'takes latest nrfc application timestamp according to ITMS' do
      Itms::NrfcApplicationReceived.create!(
        itms_id: 1,
        itms_updated_at: 2.week.from_now.change(hour: 5),
        updated_at: 2.week.from_now.change(hour: 8)
      )

      Itms::NrfcApplicationProcessed.create!(
        itms_id: 1,
        itms_updated_at: 1.week.from_now.change(hour: 6),
        updated_at: 1.week.from_now.change(hour: 9)
      )

      expect(subject.latest_nrfc_application_timestamp).to eq(1.week.from_now.change(hour: 6).to_i)
    end
  end
end
