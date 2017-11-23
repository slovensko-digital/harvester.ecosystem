class Itms::SyncAllActivitiesJob < ItmsJob
  def perform
    Itms::Activity.find_each do |activity|
      Itms::SyncActivityJob.perform_later(activity.itms_href)
    end
  end
end
