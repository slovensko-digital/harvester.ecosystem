class Itms::SyncAllBudgetItemsJob < ItmsJob
  def perform
    Itms::BudgetItem.where(deleted_at: nil).find_each do |budget_item|
      Itms::SyncBudgetItemJob.perform_later(budget_item.itms_href)
    end
  end
end
