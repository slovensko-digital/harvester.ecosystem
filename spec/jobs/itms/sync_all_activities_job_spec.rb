require 'rails_helper'

RSpec.describe Itms::SyncAllActivitiesJob, type: :job do
  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all activities' do
      Itms::Activity.create!(itms_id: 1, itms_href: '/v2/aktivita/1')
      Itms::Activity.create!(itms_id: 2, itms_href: '/v2/aktivita/2')
      Itms::Activity.create!(itms_id: 3, itms_href: '/v2/aktivita/3')

      subject.perform

      expect(Itms::SyncActivityJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncActivityJob).to have_been_enqueued.with('/v2/aktivita/1')
      expect(Itms::SyncActivityJob).to have_been_enqueued.with('/v2/aktivita/2')
      expect(Itms::SyncActivityJob).to have_been_enqueued.with('/v2/aktivita/3')
    end
  end
end
