class Itms::SyncAllProcurementContractsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    procurements_json = downloader.get_json_from_href('/v2/verejneObstaravania')
    procurements_ids = procurements_json.map { |json| json['id'] }

    procurements_ids.each do |procurement_itms_id|
      procurement = find_or_create_procurement_by_itms_id(procurement_itms_id, downloader)

      procurement_contracts_json = downloader.get_json_from_href("/v2/verejneObstaravania/#{procurement_itms_id}/zmluvyVerejneObstaravanie")
      procurement_contracts_json.each do |json|
        Itms::SyncProcurementContractJob.perform_later(json['href'], procurement)
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
