require 'harvester_utils/downloader'

class Itms::SyncAllPlannedProposalCallsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/vyzvy/planovane')
    hrefs = JSON.parse(response.body).map { |item| item['href'] }

    hrefs.each { |href| Itms::SyncPlannedProposalCallJob.perform_later(href) }
  end
end
