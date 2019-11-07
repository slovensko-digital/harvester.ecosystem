require 'rails_helper'

RSpec.describe Upvs::FindServicesWithFormsListJob, type: :job do
  describe '#perform' do
    let(:downloader) { double }

    it 'finds csv dataset url and schedules fetch job' do
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/zoznam-elektronickych-sluzieb-a-formularov-na-upvs').and_return(file_fixture('upvs/zoznam-elektronickych-sluzieb-a-formularov-na-upvs.html'))

      fetch_job = spy

      subject.perform(downloader: downloader, fetch_job: fetch_job)

      expect(fetch_job).to have_received(:perform_later).with('https://data.gov.sk/dataset/3cf33f24-f763-4fdf-b34f-3833a051d03f/resource/e4de2c28-15a0-4f22-aa70-b27f65cb3f1b/download/datasetlsprod0120190901.csv')
    end

    it 'throws error when there is no csv file detected' do
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/zoznam-elektronickych-sluzieb-a-formularov-na-upvs').and_return('<html></html>')

      expect { subject.perform(downloader: downloader) }.to raise_error(Upvs::ResourceNotFoundError)
    end
  end
end
