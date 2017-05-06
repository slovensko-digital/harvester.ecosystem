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
      expect(job).to have_received(:perform_async).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/f04158cc-9f94-4a96-8165-0aace413c9ab/download/zmenovadavka1952939.xml')
    end

    it 'schedules download of missing changes batches only' do
      expect(downloader).to receive(:get).with('https://data.gov.sk/dataset/register-adries-zmenove-davky').
        and_return(fake_response('jobs/ra/fixtures/changes-datasets.html'))

      Ra::FetchChangesBatchJob.new.perform_on_file(fixture_filepath('jobs/ra/fixtures/zmenovadavka1952939.xml'))
      subject.perform(downloader: downloader, job: job)

      expect(job).to_not have_received(:perform_async).with(/zmenovadavka1952939.xml/)
    end

    it 'fails if it receives a non-200 response' do
      expect(downloader).to receive(:get).
        and_return(fake_response('jobs/ra/fixtures/changes-datasets.html', status: 504))

      expect{ subject.perform(downloader: downloader, job: job) }.to raise_error(RuntimeError)
    end
  end
end
