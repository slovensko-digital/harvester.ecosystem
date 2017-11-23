require 'rails_helper'

RSpec.describe Itms::SyncAllAccountingDocumentsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all accounting documents' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/uctovneDoklady')
          .and_return(itms_json_fixture('uctovny_doklad_list.json'))

      subject.perform(downloader: downloader)

      expect(Itms::SyncAccountingDocumentJob).to have_been_enqueued.exactly(2).times
      expect(Itms::SyncAccountingDocumentJob).to have_been_enqueued.with('/v2/uctovneDoklady/3')
      expect(Itms::SyncAccountingDocumentJob).to have_been_enqueued.with('/v2/uctovneDoklady/4')
    end
  end
end
