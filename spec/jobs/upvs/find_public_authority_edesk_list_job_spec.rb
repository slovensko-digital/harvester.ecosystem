require 'rails_helper'

RSpec.describe Upvs::FindPublicAuthorityEdeskListJob, type: :job do
  describe '#perform' do
    let(:downloader) { double }

    it 'finds csv dataset url and schedules fetch job' do
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/zoznam-vsetkych-elektronickych-schranok-ovm').and_return(file_fixture('upvs/zoznam-vsetkych-elektronickych-schranok-ovm.html'))

      fetch_job = spy

      subject.perform(downloader: downloader, fetch_job: fetch_job)

      expect(fetch_job).to have_received(:perform_later).with('https://data.gov.sk/dataset/39d3caf6-55f7-4caf-acff-5adff747d631/resource/7333d5f8-7b74-415a-8cc8-fca277b88c5a/download/zoznamvsetkychelektronickychschranokovm.csv')
    end

    it 'throws error when there is no csv file detected' do
      expect(downloader).to receive(:download).with('https://data.gov.sk/dataset/zoznam-vsetkych-elektronickych-schranok-ovm').and_return('<html></html>')

      expect { subject.perform(downloader: downloader) }.to raise_error(Upvs::ResourceNotFoundError)
    end
  end
end
