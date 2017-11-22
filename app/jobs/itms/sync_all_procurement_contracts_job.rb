require 'harvester_utils/downloader'

class Itms::SyncAllProcurementContractsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/verejneObstaravania')
    procurements_ids = JSON.parse(response.body).map { |json| json['id'] }

    procurement_contracts_hrefs = []
    procurements_ids.map do |op_id|
      response = downloader.get("https://opendata.itms2014.sk/v2/verejneObstaravania/#{op_id}/zmluvyVerejneObstaravanie")
      procurement_contracts_hrefs.concat(JSON.parse(response.body).map { |json| json['href'] })
    end

    procurement_contracts_hrefs.map do |href|
      Itms::SyncProcurementContractJob.perform_later(href)
    end
  end
end
