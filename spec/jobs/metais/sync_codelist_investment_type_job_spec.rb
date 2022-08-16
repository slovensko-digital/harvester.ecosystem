require 'rails_helper'

RSpec.describe Metais::SyncCodelistInvestmentTypeJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_investment_type_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
    end

    it 'saves codelist_investment_type' do
      subject.perform

      expect(Metais::CodelistInvestmentType.find_by(code: "c_zmenova_poziadavka")).to have_attributes(
        code: "c_zmenova_poziadavka",
        nazov: "Change request",
        order_list: 2,
        popis: "Popis investície",
      )
    end

    # TODO test for update
  end
end
