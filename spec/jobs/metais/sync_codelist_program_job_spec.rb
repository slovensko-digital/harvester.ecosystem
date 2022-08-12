require 'rails_helper'

RSpec.describe Metais::SyncCodelistProgramJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:codelist_program) { build(:metais_codelist_program) }

    let(:client) { instance_double(Faraday::Connection, post: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('codelist_program_response.json') }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:post) { faraday_response }
    end

    it 'saves codelist_program' do
      subject.perform

      ignored = ["id", "updated_at", "created_at"]
      expect(Metais::CodelistProgram.find_by(kod_metais: codelist_program.kod_metais).attributes.except(*ignored)).to eq(codelist_program.attributes.except(*ignored))
    end

    # TODO test for update
  end
end
