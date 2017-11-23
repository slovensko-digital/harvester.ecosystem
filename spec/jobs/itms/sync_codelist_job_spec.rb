require 'rails_helper'

RSpec.describe Itms::SyncCodelistJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs a codelist (but not its values)' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/ciselniky')
          .and_return(itms_json_fixture('ciselniky_list.json'))
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
