require 'rails_helper'

RSpec.describe Metais::SyncCodelistInvestmentTypeJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:codelist_investment_type) { build(:metais_codelist_investment_type) }

    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_investment_type_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
    end

    it 'saves codelist_investment_type' do
      subject.perform

      ignored = ["id", "updated_at", "created_at"]
      expect(Metais::CodelistInvestmentType.find_by(code: codelist_investment_type.code).attributes.except(*ignored)).to eq(codelist_investment_type.attributes.except(*ignored))
    end

    # TODO test for update
  end
end
