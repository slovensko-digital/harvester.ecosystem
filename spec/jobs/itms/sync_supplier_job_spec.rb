require 'rails_helper'

RSpec.describe Itms::SyncSupplierJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'temporarily creates an object with itms id' do
      subject.perform('/v2/dodavatelia/229', downloader: downloader)

      expect(Itms::Supplier.first).to have_attributes(
        itms_id: 229,
      )
    end

    pending 'syncs supplier and all of its attributes'
  end
end
