require 'rails_helper'

RSpec.describe Itms::SyncBudgetItemJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'temporarily creates an object with itms id' do
      subject.perform('/v2/polozkaRozpoctu/1', downloader: downloader)

      expect(Itms::BudgetItem.first).to have_attributes(
        itms_id: 1,
      )
    end

    pending 'syncs budget item and all of its attributes'
  end
end
