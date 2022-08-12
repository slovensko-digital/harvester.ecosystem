require 'rails_helper'

RSpec.describe Metais::SyncRelatedDocumentsJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  context "project document" do
    describe '#perform' do
      let(:client) { instance_double(Faraday::Connection, post: faraday_response) }
      let(:faraday_response) { instance_double(Faraday::Response, body: body) }
      let(:body) { metais_json_fixture('project_documents_response.json') }

      let(:document_version) { build(:metais_project_document_version) }
      let(:project) { build(:metais_project) }

      before do
        allow(Faraday).to receive(:new) { client } 
        allow(client).to receive(:post) { faraday_response }
        project.save
      end

      it 'queues SyncRelatedDocuments job' do
        subject.perform(project)

        expect(Metais::SyncDocumentJob).to have_been_enqueued.exactly(9).times
        expect(Metais::SyncDocumentJob).to have_been_enqueued.with(project, JSON.parse(document_version.raw_data))
      end
    end
  end

  context "isvs document" do
    describe '#perform' do
      let(:client) { instance_double(Faraday::Connection, post: faraday_response) }
      let(:faraday_response) { instance_double(Faraday::Response, body: body) }
      let(:body) { metais_json_fixture('project_documents_response.json') }

      let(:document_version) { build(:metais_isvs_document_version) }
      let(:isvs) { build(:metais_isvs) }

      before do
        allow(Faraday).to receive(:new) { client } 
        allow(client).to receive(:post) { faraday_response }
        isvs.save
      end

      it 'queues SyncRelatedDocuments job' do
        subject.perform(isvs)

        expect(Metais::SyncDocumentJob).to have_been_enqueued.exactly(18).times
        expect(Metais::SyncDocumentJob).to have_been_enqueued.with(isvs, JSON.parse(document_version.raw_data))
      end
    end
  end
end
