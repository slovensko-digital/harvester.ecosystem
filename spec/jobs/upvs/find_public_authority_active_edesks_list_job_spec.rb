require 'rails_helper'

RSpec.describe Upvs::FindPublicAuthorityActiveEdesksListJob, type: :job do
  include ActiveJob::TestHelper

  let(:csv_url) { 'https://data.slovensko.sk/download?id=794af827-132b-46d1-98e7-ccd73eda26e0' }
  let(:xlsx_url) { 'https://data.slovensko.sk/download?id=2350ef8f-9b8f-43c0-b075-dda38dd052d1' }

  after do
    clear_enqueued_jobs
  end

  describe "#perform" do
    before do
      stub_request(:get, "https://data.slovensko.sk/api/sparql")
        .with(query: hash_including({"query": kind_of(String)}))
        .to_return(status: 200, body: "downloadURL\n#{csv_url}\n#{xlsx_url}\n")

      stub_request(:get, csv_url).to_return(headers: {'Content-Disposition': 'filename.csv'})
      stub_request(:get, xlsx_url).to_return(headers: {'Content-Disposition': 'filename.xlsx'})
    end

    it 'calls FetchPublicAuthorityActiveEdesksListJob with correct dataset url' do
      expect(Upvs::FetchPublicAuthorityActiveEdesksListJob).to receive(:perform_now).with(csv_url)
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
