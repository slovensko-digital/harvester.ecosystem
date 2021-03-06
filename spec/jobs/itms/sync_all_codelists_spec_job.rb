require 'rails_helper'

RSpec.describe Itms::SyncAllCodelistsJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all codelists' do
      Itms::Codelist.create(ciselnik_kod: 1)
      Itms::Codelist.create(ciselnik_kod: 2)
      Itms::Codelist.create(ciselnik_kod: 3)

      subject.perform

      expect(Itms::SyncCodelistJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncCodelistJob).to have_been_enqueued.with(1)
      expect(Itms::SyncCodelistJob).to have_been_enqueued.with(2)
      expect(Itms::SyncCodelistJob).to have_been_enqueued.with(3)
    end
  end
end
