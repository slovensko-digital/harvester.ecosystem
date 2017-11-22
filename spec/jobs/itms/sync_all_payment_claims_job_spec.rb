require 'rails_helper'

RSpec.describe Itms::SyncAllPaymentClaimsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all payment claims' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/zop/predlozene')
          .and_return(double(body: itms_file_fixture('zop_predlozena_list.json')))

      subject.perform(downloader: downloader)

      expect(Itms::SyncPaymentClaimJob).to have_been_enqueued.with('/v2/zop/predlozene/2')
      expect(Itms::SyncPaymentClaimJob).to have_been_enqueued.with('/v2/zop/predlozene/3')
      expect(Itms::SyncPaymentClaimJob).to have_been_enqueued.with('/v2/zop/predlozene/4')
    end
  end
end
