require 'rails_helper'

RSpec.describe Metais::SyncCodelistProgramJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:client) { instance_double(Faraday::Connection, post: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_program_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:post) { faraday_response }
    end

    it 'saves codelist_program' do
      subject.perform

      expect(Metais::CodelistProgram.find_by(kod_metais: "prg_36")).to have_attributes(
        kod_metais: "prg_36",
        nazov: "Fond obnovy a odolnosti RRF",
        nazov_en: "Recovery and Resilience Facility",
        ref_id: "https://data.gov.sk/id/egov/operational-program/36",
        zdroj: "c_zdroj.1",
        raw_data: '{"type":"Program","uuid":"74c92785-4bb3-4bff-957c-e5783b2035a1","attributes":[{"name":"Gen_Profil_anglicky_nazov","value":"Recovery and Resilience Facility"},{"name":"Gen_Profil_kod_metais","value":"prg_36"},{"name":"Gen_Profil_nazov","value":"Fond obnovy a odolnosti RRF"},{"name":"Gen_Profil_zdroj","value":"c_zdroj.1"},{"name":"Gen_Profil_ref_id","value":"https://data.gov.sk/id/egov/operational-program/36"}],"metaAttributes":{"owner":"1d8a37f7-3063-46d2-b66a-c1b0c8471878-67d48d04-321e-426e-a321-e0bc6fa40437","state":"DRAFT","createdBy":"martin.bezek","createdAt":"2021-01-25T11:17:26.652Z","lastModifiedBy":"janka.rejtova","lastModifiedAt":"2021-07-07T12:59:30.835Z"}}',
      )
    end

    # TODO test for update
  end
end
