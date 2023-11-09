require 'rails_helper'

RSpec.describe Upvs::FindPublicAuthorityActiveEdeskListJob, type: :job do
  describe '#perform' do
    let(:downloader) { double }

    it 'finds csv dataset url and schedules fetch job' do
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/zoznam-ovm-s-aktivovanou-elektronickou-schrankou').and_return(file_fixture('upvs/zoznam-ovm-s-aktivovanou-elektronickou-schrankou.html'))

      fetch_job = spy

      subject.perform(downloader: downloader, fetch_job: fetch_job)

      expect(fetch_job).to have_received(:perform_later).with('https://data.gov.sk/dataset/81764225-893b-4e6a-a6a1-3fbbe56fcb69/resource/8a7be09f-da39-429d-80f1-f181fcdea9e3/download/zoznamovmsaktivovanouschrankou.csv')
    end

    it 'throws error when there is no csv file detected' do
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/zoznam-ovm-s-aktivovanou-elektronickou-schrankou').and_return('<html></html>')

      expect { subject.perform(downloader: downloader) }.to raise_error(Upvs::ResourceNotFoundError)
    end
  end
end
