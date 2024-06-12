require 'rails_helper'

RSpec.describe Upvs::FindPublicAuthorityEdesksListJob, type: :job do
  include ActiveJob::TestHelper

  let(:url) { 'https://data.slovensko.sk/download?id=7c70f6c9-1777-4d8a-8711-f1dfd2359620' }

  after do
    clear_enqueued_jobs
  end

  describe "#perform" do
    before do
      stub_request(:get, "https://data.slovensko.sk/api/sparql")
        .with(query: hash_including({"query": kind_of(String)}))
        .to_return(status: 200, body: "downloadURL\n#{url}\n")
    end

    it 'calls FetchPublicAuthorityEdesksListJob with correct dataset url' do
      expect(Upvs::FetchPublicAuthorityEdesksListJob).to receive(:perform_now).with(url)
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
