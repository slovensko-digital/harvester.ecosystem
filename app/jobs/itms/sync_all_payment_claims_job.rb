require 'harvester_utils/downloader'

class Itms::SyncAllPaymentClaimsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/zop/predlozene')
    hrefs = JSON.parse(response.body).map { |item| item['href'] }

    hrefs.each { |href| Itms::SyncPaymentClaimJob.perform_later(href) }
  end
end
