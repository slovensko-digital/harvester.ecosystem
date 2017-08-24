require 'rails_helper'

RSpec.describe Upvs::FindPublicAuthorityEdeskListJob, type: :job do
  context '#perform' do
    it 'finds csv dataset url and schedules fetch job' do
      downloader = double
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/upvs-institucie-so-schrankou').and_return(file_fixture('jobs/upvs/fixtures/upvs-institucie-so-schrankou.html'))

      fetch_job = spy

      subject.perform(downloader: downloader, fetch_job: fetch_job)

      expect(fetch_job).to have_received(:perform_later).with('https://data.gov.sk/dataset/7d918796-3c9a-44a5-95a9-7e1dfca76407/resource/456a5bc6-32bd-4346-bcd1-12ee171ac010/download/zoznamintituciisozriadenouelektronickouschrankou8.csv')
    end
  end
end
