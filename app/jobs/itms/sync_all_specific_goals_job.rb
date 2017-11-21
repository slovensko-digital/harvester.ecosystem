require 'harvester_utils/downloader'

class Itms::SyncAllSpecificGoalsJob < ItmsJob
  def perform
    Itms::SpecificGoal.find_each do |specific_goal|
      Itms::SyncSpecificGoalJob.perform_later(specific_goal.itms_href)
    end
  end
end
