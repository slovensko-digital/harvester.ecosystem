require 'rails_helper'

RSpec.describe Itms::SyncAllCodelistValuesJob, type: :job do
  let(:downloader) { double(:downloader) }
  let(:codelist) { Itms::Codelist.first_or_create!(ciselnik_kod: 456) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all codelist values' do
      Itms::CodelistValue.create(ciselnik: codelist, itms_id: 1, itms_href: '/v2/hodnotaCiselnika/456/hodnota/1')
      Itms::CodelistValue.create(ciselnik: codelist, itms_id: 2, itms_href: '/v2/hodnotaCiselnika/456/hodnota/2')
      Itms::CodelistValue.create(ciselnik: codelist, itms_id: 3, itms_href: '/v2/hodnotaCiselnika/456/hodnota/3')

      subject.perform

      expect(Itms::SyncCodelistValueJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncCodelistValueJob).to have_been_enqueued.with('/v2/hodnotaCiselnika/456/hodnota/1')
      expect(Itms::SyncCodelistValueJob).to have_been_enqueued.with('/v2/hodnotaCiselnika/456/hodnota/2')
      expect(Itms::SyncCodelistValueJob).to have_been_enqueued.with('/v2/hodnotaCiselnika/456/hodnota/3')
    end
  end
end
