require 'harvester_utils/downloader'

class Itms::SyncAllBudgetItemsJob < ItmsJob
  def perform
    Itms::BudgetItem.find_each do |budget_item|
      Itms::SyncBudgetItemJob.perform_later(budget_item.itms_href)
    end
  end
end
