require 'rails_helper'

RSpec.describe Metais::SyncCodelistInvestmentTypeJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform', order: :defined do
    ActiveJob::Base.queue_adapter = :test

    context "with no previous codelist data" do
      let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
      let(:faraday_response) { instance_double(Faraday::Response, body: body) }
      let(:body) { metais_json_fixture('codelist_investment_type_response.json') }

      it 'saves codelist_investment_type' do
        allow(Faraday).to receive(:new) { client } 
        allow(client).to receive(:get) { faraday_response }

        subject.perform

        expect(Metais::CodelistInvestmentType.find_by(code: "c_zmenova_poziadavka")).to have_attributes(
          nazov: "Change request",
          order_list: 2,
          popis: "Popis investície",
        )
      end
    end

    context "with different values" do
      let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
      let(:faraday_response) { instance_double(Faraday::Response, body: body) }
      let(:body) { metais_json_fixture('codelist_investment_type_update_response.json') }

      let!(:codelist_investment_type) { create(:metais_codelist_investment_type) }

      it 'updates codelist_investment_type' do
        allow(Faraday).to receive(:new) { client } 
        allow(client).to receive(:get) { faraday_response }

        expect(Metais::CodelistInvestmentType.find_by(code: "c_zmenova_poziadavka")).to have_attributes(
          nazov: "Change request",
        )

        expect{
          subject.perform
        }.to change(Metais::CodelistInvestmentType, :count).by(0)

        expect(Metais::CodelistInvestmentType.find_by(code: "c_zmenova_poziadavka")).to have_attributes(
          nazov: "updated Change request",
          order_list: 2,
          popis: "Popis investície",
        )
      end
    end
  end
end
