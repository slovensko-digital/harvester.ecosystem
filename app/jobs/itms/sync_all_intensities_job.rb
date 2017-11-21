require 'harvester_utils/downloader'

class Itms::SyncAllIntensitiesJob < ItmsJob
  def perform
    Itms::Intensity.find_each do |intensity|
      Itms::SyncIntensityJob.perform_later(intensity.itms_href)
    end
  end
end
