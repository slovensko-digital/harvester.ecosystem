require 'rails_helper'

RSpec.describe Itms::SyncCodelistJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs a codelist (but not its values)' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/ciselniky')
          .and_return(double(body: itms_file_fixture('ciselniky_list.json')))
          .once

      subject.perform(1001, downloader: downloader)

      expect(Itms::Codelist.first).to have_attributes(
          ciselnik_kod: 1001,
          nazov: "Banky (NBS)",
          popis: "Číselník bánk pôsobiacich v SR. Číselník spravuje NBS",
      )
    end
  end
end
