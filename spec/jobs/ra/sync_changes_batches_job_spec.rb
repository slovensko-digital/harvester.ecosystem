require 'rails_helper'

RSpec.describe Ra::SyncChangesBatchesJob, type: :job do
  describe '#perform' do
    let(:job) { spy }
    let(:downloader) { double }

    it 'schedules download of changes batches' do
      expect(downloader).to receive(:get).with('https://data.gov.sk/dataset/register-adries-zmenove-davky').
        and_return(fake_response('jobs/ra/fixtures/changes-datasets.html'))

      subject.perform(downloader: downloader, job: job)

      expect(job).to have_received(:perform_async).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/be6e0033-8004-41d7-8929-0484e24e9347/download/zmenovadavka234191.xml')
      expect(job).to have_received(:perform_async).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/a2f3260d-1647-4953-888d-26688e07dca2/download/zmenovadavka5369741.xml')
    end

    pending 'schedules download of missing changes batches only'
  end
end
