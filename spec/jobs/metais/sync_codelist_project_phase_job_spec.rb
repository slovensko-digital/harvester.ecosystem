require 'rails_helper'

RSpec.describe Metais::SyncCodelistProjectPhaseJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    context "with no previous codelist data" do
      let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
      let(:faraday_response) { instance_double(Faraday::Response, body: body) }
      let(:body) { metais_json_fixture('codelist_project_phase_response.json') }

      it 'saves codelist_project_phase' do
        allow(Faraday).to receive(:new) { client } 
        allow(client).to receive(:get) { faraday_response }

        subject.perform

        expect(Metais::CodelistProjectPhase.find_by(code: "c_faza_projektu.5")).to have_attributes(
          code: "c_faza_projektu.5",
          nazov: "Completed project",
          order_list: 5,
          popis: "Completed and implemented project.",
        )
      end
    end

    context "with different values" do
      let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
      let(:faraday_response) { instance_double(Faraday::Response, body: body) }
      let(:body) { metais_json_fixture('codelist_project_phase_update_response.json') }

      let!(:codelist_project_phase) { create(:metais_codelist_project_phase) }
      
      it 'saves codelist_project_phase' do
        allow(Faraday).to receive(:new) { client } 
        allow(client).to receive(:get) { faraday_response }

        expect(Metais::CodelistProjectPhase.find_by(code: "c_faza_projektu.5")).to have_attributes(
          nazov: "Completed project",
        )

        expect {
          subject.perform
        }.to change(Metais::CodelistProjectPhase, :count).by(0)

        expect(Metais::CodelistProjectPhase.find_by(code: "c_faza_projektu.5")).to have_attributes(
          code: "c_faza_projektu.5",
          nazov: "updated Completed project",
          order_list: 5,
          popis: "Completed and implemented project.",
        )
      end
    end
  end
end
