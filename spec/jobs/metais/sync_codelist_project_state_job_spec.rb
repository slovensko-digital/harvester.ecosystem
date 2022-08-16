require 'rails_helper'

RSpec.describe Metais::SyncCodelistProjectStateJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_project_state_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
    end

    it 'saves codelist_project_state' do
      subject.perform

      expect(Metais::CodelistProjectState.find_by(code: "c_stav_projektu_1")).to have_attributes(
        code: "c_stav_projektu_1",
        nazov: "Draft",
        order_list: 1,
        popis: "Popis stavu projektu",
      )
    end

    # TODO test for update
  end
end
