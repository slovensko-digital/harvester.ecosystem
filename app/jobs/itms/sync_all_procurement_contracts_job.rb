require 'harvester_utils/downloader'

class Itms::SyncAllProcurementContractsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/verejneObstaravania')
    procurements_ids = JSON.parse(response.body).map { |json| json['id'] }

    procurements_ids.map do |procurement_itms_id|
      procurement = find_or_create_procurement_by_itms_id(procurement_itms_id, downloader)

      response = downloader.get("https://opendata.itms2014.sk/v2/verejneObstaravania/#{procurement_itms_id}/zmluvyVerejneObstaravanie")
      procurement_contracts_hrefs = JSON.parse(response.body).map { |json| json['href'] }

      procurement_contracts_hrefs.map do |href|
        Itms::SyncProcurementContractJob.perform_later(href, procurement)
      end
    end
  end

  private

  def find_or_create_procurement_by_itms_id(procurement_itms_id, downloader)
    existing_object = Itms::Procurement.find_by(itms_id: procurement_itms_id)
    return existing_object if existing_object.present?

    Itms::SyncProcurementJob.perform_now("/v2/verejneObstaravania/#{procurement_itms_id}", downloader: downloader)
    Itms::Procurement.find_by!(itms_id: procurement_itms_id)
  end
end
