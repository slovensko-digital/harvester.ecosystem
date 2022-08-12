require 'rails_helper'

RSpec.describe Metais::SyncDocumentJob, type: :job do
  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test
    
    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('document_response.json') }

    let(:document) { build(:metais_project_document) }
    let(:document_version) { build(:metais_project_document_version) }
    let(:project) { build(:metais_project) }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
      project.save
    end

    it 'saves project document' do
      subject.perform(project, JSON.parse(document_version.raw_data))

      expect(Metais::ProjectDocument.last).to have_attributes(uuid: document.uuid)

      expect(Metais::ProjectDocumentVersion.last).to have_attributes(document_id: Metais::ProjectDocument.last.id)
      ignored = ["id", "updated_at", "created_at", "raw_data", "document_id"]
      expect(Metais::ProjectDocumentVersion.last.attributes.except(*ignored)).to eq(document_version.attributes.except(*ignored))
    end
  end
end
