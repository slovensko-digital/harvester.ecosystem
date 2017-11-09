require 'rails_helper'

RSpec.describe Itms::SyncAllCodelistsJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all codelists and enqueues sync jobs for their values' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/ciselniky')
          .and_return(double(body: itms_file_fixture('ciselniky_list.json')))
          .once

      expect {
        subject.perform(downloader: downloader)
      }.to change{ Itms::Codelist.count }.by(77)
       .and have_enqueued_job(Itms::SyncCodelistValuesJob).exactly(77).times
       .and have_enqueued_job(Itms::SyncCodelistValuesJob).with(1001)

      expect(Itms::Codelist.first).to have_attributes(
          ciselnik_kod: 1001,
          nazov: "Banky (NBS)",
          popis: "Číselník bánk pôsobiacich v SR. Číselník spravuje NBS",
      )
    end
  end
end
