require 'rails_helper'

RSpec.describe Metais::SyncAllProjectsJob, type: :job do
  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    let(:client) { instance_double(Faraday::Connection, post: faraday_response) }
    let(:faraday_response) { instance_double(Faraday::Response, body: body) }
    let(:body) { metais_json_fixture('all_projects_response.json') }

    let(:project_version) { build(:metais_project_version) }

    before do
      allow(Faraday).to receive(:new) { client } 
      allow(client).to receive(:post) { faraday_response }
    end    

    it 'queues SyncProject job' do
      subject.perform

      expect(Metais::SyncProjectJob).to have_been_enqueued.exactly(1).times
      expect(Metais::SyncProjectJob).to have_been_enqueued.with(JSON.parse(project_version.raw_data))
    end
  end
end
