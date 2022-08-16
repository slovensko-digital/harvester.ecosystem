require 'rails_helper'

RSpec.describe Metais::SyncCodelistSourceJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_source_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
    end

    it 'saves codelist_source' do
      subject.perform

      expect(Metais::CodelistSource.find_by(code: "c_zdroj.6")).to have_attributes(
        code: "c_zdroj.6",
        nazov: "System",
        order_list: 1,
        popis: "Implicit system entity",
      )
    end

    # TODO test for update
  end
end
