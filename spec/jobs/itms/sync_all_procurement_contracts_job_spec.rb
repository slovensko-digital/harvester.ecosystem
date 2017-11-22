require 'rails_helper'

RSpec.describe Itms::SyncAllProcurementContractsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all specific goals' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/verejneObstaravania')
          .and_return(double(body: itms_file_fixture('verejne_obstaravanie_list.json')))

      expect(downloader)
          .to receive(:get)
          .with(/\/v2\/verejneObstaravania\/\d+\/zmluvyVerejneObstaravanie$/)
          .and_return(double(body: itms_file_fixture('zmluva_verejne_obstaravanie_list.json')))
          .exactly(3).times

      subject.perform(downloader: downloader)

      expect(Itms::SyncProcurementContractJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncProcurementContractJob).to have_been_enqueued.with('/v2/zmluvaVerejneObstaravanie/342').at_least(:once)
    end
  end
end
