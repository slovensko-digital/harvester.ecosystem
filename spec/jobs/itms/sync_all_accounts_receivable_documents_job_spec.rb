require 'rails_helper'

RSpec.describe Itms::SyncAllAccountsReceivableDocumentsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all projects' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/pohladavkovyDoklad')
          .and_return(double(body: itms_file_fixture('pohladavkovy_doklad_list.json')))

      subject.perform(downloader: downloader)

      expect(Itms::SyncAccountsReceivableDocumentJob).to have_been_enqueued.exactly(230).times
      expect(Itms::SyncAccountsReceivableDocumentJob).to have_been_enqueued.with('/v2/pohladavkovyDoklad/2')
    end
  end
end