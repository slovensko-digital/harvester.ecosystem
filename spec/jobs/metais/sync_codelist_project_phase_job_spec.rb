require 'rails_helper'

RSpec.describe Metais::SyncCodelistProjectPhaseJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:codelist_project_phase) { build(:metais_codelist_project_phase) }

    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_project_phase_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
    end

    it 'saves codelist_project_phase' do
      subject.perform

      ignored = ["id", "updated_at", "created_at"]
      expect(Metais::CodelistProjectPhase.find_by(code: codelist_project_phase.code).attributes.except(*ignored)).to eq(codelist_project_phase.attributes.except(*ignored))
    end

    # TODO test for update
  end
end
