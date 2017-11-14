require 'rails_helper'

RSpec.describe Itms::SyncAccountingDocumentJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'temporarily creates an object with itms id' do
      subject.perform('/v2/uctovneDoklady/123', downloader: downloader)

      expect(Itms::AccountingDocument.first).to have_attributes(
        itms_id: 123,
      )
    end

    pending 'syncs non-repayable financial contribution request and all of its attributes'
  end
end
