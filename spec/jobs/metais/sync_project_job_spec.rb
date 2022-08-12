require 'rails_helper'

RSpec.describe Metais::SyncProjectJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:project) { build(:metais_project) }
    let(:project_version) { build(:metais_project_version) }

    it 'saves project and queues another jobs' do
      expect {
        subject.perform(JSON.parse(project_version.raw_data))
      }.to change(Metais::Project, :count).by(1)

      expect(Metais::Project.last).to have_attributes(uuid: project.uuid)
      expect(Metais::ProjectVersion.count).to eq(1)

      expect(Metais::ProjectVersion.last).to have_attributes(project_id: Metais::Project.last.id)
      ignored = ["id", "updated_at", "created_at", "raw_data", "project_id"]
      expect(Metais::ProjectVersion.last.attributes.except(*ignored)).to eq(project_version.attributes.except(*ignored))

      expect(Metais::SyncProjectsIsvsJob).to have_been_enqueued.exactly(1).times
      expect(Metais::SyncRelatedDocumentsJob).to have_been_enqueued.exactly(1).times
    end

    # TODO test for update
  end
end
