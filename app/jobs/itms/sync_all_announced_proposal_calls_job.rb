require 'harvester_utils/downloader'

class Itms::SyncAllAnnouncedProposalCallsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/vyzvy/vyhlasene')
    hrefs = JSON.parse(response.body).map { |item| item['href'] }

    hrefs.each { |href| Itms::SyncAnnouncedProposalCallJob.perform_later(href) }
  end
end
