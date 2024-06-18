require 'rails_helper'

RSpec.describe Upvs::FindServicesWithFormsListJob, type: :job do
  include ActiveJob::TestHelper

  let(:url) { 'https://data.slovensko.sk/download?id=c78de203-caa5-4d1d-9496-975f0e2567d1' }

  after do
    clear_enqueued_jobs
  end

  describe "#perform" do
    before do
      stub_request(:get, "https://data.slovensko.sk/api/sparql")
        .with(query: hash_including({"query": kind_of(String)}))
        .to_return(status: 200, body: "downloadURL\n#{url}\n")

      stub_request(:get, url).to_return(headers: {'Content-Disposition': 'filename.zip'})
    end

    it 'calls FetchServicesWithFormsListJob with correct dataset url' do
      expect(Upvs::FetchServicesWithFormsListJob).to receive(:perform_now).with(url)
      subject.perform
    end

    it 'raises an error when the request is unsuccessful' do
      stub_request(:get, "https://data.slovensko.sk/api/sparql")
        .with(query: hash_including({"query": kind_of(String)}))
        .to_return(status: 500, body: "Internal Server Error\n")

      expect {
        subject.perform
      }.to raise_error(/Request to find latest dataset URL for set:/)
    end
  end
end
