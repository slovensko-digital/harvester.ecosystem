require 'rails_helper'

RSpec.describe Itms::SyncAllBudgetItemsJob, type: :job do
  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all budget items' do
      Itms::BudgetItem.create!(itms_id: 1, itms_href: '/v2/polozkaRozpoctu/1')
      Itms::BudgetItem.create!(itms_id: 2, itms_href: '/v2/polozkaRozpoctu/2')
      Itms::BudgetItem.create!(itms_id: 3, itms_href: '/v2/polozkaRozpoctu/3')

      subject.perform

      expect(Itms::SyncBudgetItemJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncBudgetItemJob).to have_been_enqueued.with('/v2/polozkaRozpoctu/1')
      expect(Itms::SyncBudgetItemJob).to have_been_enqueued.with('/v2/polozkaRozpoctu/2')
      expect(Itms::SyncBudgetItemJob).to have_been_enqueued.with('/v2/polozkaRozpoctu/3')
    end
  end
end
