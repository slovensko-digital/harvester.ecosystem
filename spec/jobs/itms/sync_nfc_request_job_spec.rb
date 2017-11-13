require 'rails_helper'

RSpec.describe Itms::SyncNfcRequestJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'temporarily creates an object with itms id' do
      subject.perform('/v2/zonfp/schvalene/48', downloader: downloader)

      expect(Itms::NfcRequest.first).to have_attributes(
        itms_id: 48,
      )
    end

    pending 'syncs non-repayable financial contribution request and all of its attributes'
  end
end
