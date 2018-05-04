require 'rails_helper'

RSpec.describe Itms::SyncAllIntensitiesJob, type: :job do
  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all intensities' do
      Itms::Intensity.create!(itms_id: 1, itms_href: '/v2/intenzita/1')
      Itms::Intensity.create!(itms_id: 2, itms_href: '/v2/intenzita/2')
      Itms::Intensity.create!(itms_id: 3, itms_href: '/v2/intenzita/3')

      subject.perform

      expect(Itms::SyncIntensityJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncIntensityJob).to have_been_enqueued.with('/v2/intenzita/1')
      expect(Itms::SyncIntensityJob).to have_been_enqueued.with('/v2/intenzita/2')
      expect(Itms::SyncIntensityJob).to have_been_enqueued.with('/v2/intenzita/3')
    end
  end
end
