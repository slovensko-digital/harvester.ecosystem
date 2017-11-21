require 'rails_helper'

RSpec.describe Itms::SyncAllSpecificGoalsJob, type: :job do
  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all specific goals' do
      Itms::SpecificGoal.create!(itms_id: 1, itms_href: '/v2/konkretnyCiel/1')
      Itms::SpecificGoal.create!(itms_id: 2, itms_href: '/v2/konkretnyCiel/2')
      Itms::SpecificGoal.create!(itms_id: 3, itms_href: '/v2/konkretnyCiel/3')

      subject.perform

      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/1')
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/2')
      expect(Itms::SyncSpecificGoalJob).to have_been_enqueued.with('/v2/konkretnyCiel/3')
    end
  end
end
