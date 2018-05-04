require 'rails_helper'

RSpec.describe Itms::SyncAllProcurementsJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all accounting documents' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/verejneObstaravania')
          .and_return(itms_json_fixture('verejne_obstaravanie_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncProcurementJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncProcurementJob).to have_been_enqueued.with('/v2/verejneObstaravania/2')
      expect(Itms::SyncProcurementJob).to have_been_enqueued.with('/v2/verejneObstaravania/5')
      expect(Itms::SyncProcurementJob).to have_been_enqueued.with('/v2/verejneObstaravania/10')
    end
  end
end
