require 'rails_helper'

RSpec.describe Metais::SyncDocumentJob, type: :job do
  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test
    
    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('document_response.json') }

    let(:document_version) { build(:metais_project_document_version) }
    let!(:project) { create(:metais_project) }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
    end

    it 'saves project document' do
      subject.perform(project, JSON.parse(document_version.raw_data))

      expect(Metais::ProjectDocument.last).to have_attributes(
        project: project,
        latest_version: Metais::ProjectDocumentVersion.last,
        uuid: "ac9aeb96-0ba1-248c-a65c-a397edddc037",
      )

      expect(Metais::ProjectDocumentVersion.last).to have_attributes(
        document: Metais::ProjectDocument.last,
        nazov: "Hodnotenie projektu",
        kod_metais: "dokument_4308",
        ref_id: "https://data.gov.sk/doc/metais-attached-document/4308",
        mimetype: "application/pdf",
        size: 874482,
        stav_evidencie: "CREATED",
        typ: "hodnotenie_projektu",
        filename: "Stanovisko _1407.pdf",
        metais_created_at: Time.parse("2021-09-28T16:21:07.131+02:00").utc,
        metais_updated_at: Time.parse("2021-09-28T16:21:07.131+02:00").utc,
        raw_data: '{"type":"Dokument","uuid":"ac9aeb96-0ba1-248c-a65c-a397edddc037","attributes":[{"name":"Gen_Profil_kod_metais","value":"dokument_4308"},{"name":"Gen_Profil_nazov","value":"Hodnotenie projektu"},{"name":"Gen_Profil_zdroj","value":"c_zdroj.1"},{"name":"Profil_Dokument_Projekt_typ_dokumentu","value":"hodnotenie_projektu"},{"name":"Gen_Profil_ref_id","value":"https://data.gov.sk/doc/metais-attached-document/4308"}],"metaAttributes":{"owner":"1d8a37f7-3063-46d2-b66a-c1b0c8471878-88027af4-7459-44fa-922a-317ac7dccdfb","state":"DRAFT","createdBy":"peter.saraka1","createdAt":"2021-09-28T14:21:08.833Z","lastModifiedBy":"peter.saraka1","lastModifiedAt":"2021-09-28T14:21:08.833Z"}}',
        raw_meta: '{"uuid":"ac9aeb96-0ba1-248c-a65c-a397edddc037","status":"CREATED","version":"1.0","mimeType":"application/pdf","encoding":null,"filename":"Stanovisko _1407.pdf","contentLength":874482,"created":"2021-09-28T16:21:07.131+02:00","createdBy":"peter.saraka1","lastModified":"2021-09-28T16:21:07.131+02:00","lastModifiedBy":"peter.saraka1"}',
      )
    end

    # TODO test for update
  end
end
