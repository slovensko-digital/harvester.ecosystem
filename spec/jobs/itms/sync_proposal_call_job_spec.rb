require 'rails_helper'

RSpec.describe Itms::SyncProposalCallJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'temporarily creates an object with itms id' do
      subject.perform('/v2/vyzvy/vyhlasene/1', downloader: downloader)

      expect(Itms::ProposalCall.first).to have_attributes(
        itms_id: 1,
      )
    end

    pending 'syncs call for proposals object and all of its attributes'
  end
end
