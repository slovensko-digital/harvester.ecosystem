require 'rails_helper'

RSpec.describe Metais::SyncIsvsJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:isvs) { build(:metais_isvs) }
    let(:isvs_version) { build(:metais_isvs_version) }
    let(:project) { build(:metais_project) }

    it 'saves isvs and quese another jobs' do
      expect {
        subject.perform(project, JSON.parse(isvs_version.raw_data))
      }.to change(Metais::Isvs, :count).by(1)

      expect(Metais::Isvs.last).to have_attributes(uuid: isvs.uuid)
      expect(Metais::IsvsVersion.count).to eq(1)

      expect(Metais::IsvsVersion.last).to have_attributes(isvs_id: Metais::Isvs.last.id)
      ignored = ["id", "updated_at", "created_at", "raw_data", "isvs_id"]
      expect(Metais::IsvsVersion.last.attributes.except(*ignored)).to eq(isvs_version.attributes.except(*ignored))

      expect(Metais::SyncRelatedDocumentsJob).to have_been_enqueued.exactly(1).times
    end
  end
end
