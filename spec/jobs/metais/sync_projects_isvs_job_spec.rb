require 'rails_helper'

RSpec.describe Metais::SyncProjectsIsvsJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:client) { instance_double(Faraday::Connection, get: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('isvs_response.json') }

    let(:isvs_version) { build(:metais_isvs_version) }
    let(:project) { build(:metais_project) }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:get) { faraday_response }
      project.save
    end

    it 'queues SyncIsvs job' do
      subject.perform(project)

      expect(Metais::SyncIsvsJob).to have_been_enqueued.exactly(2).times
    end
  end
end
