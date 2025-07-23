class Itms::SyncAllProcurementContractsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: nil)
    procurements_json = get_all_procurements_in_chunks(downloader)

    procurements_json.each do |procurement_item|
      procurement = find_or_create_procurement_by_itms_id(procurement_item['id'], downloader)

      procurement_contracts_json = downloader.get_json_from_href("/v2/verejneObstaravania/#{procurement_item['id']}/zmluvyVerejneObstaravanie", modifiedSince: modified_since.presence || Itms::ProcurementContract.where(verejne_obstaravanie: procurement).latest&.updated_at&.to_i)
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

  def get_all_procurements_in_chunks(downloader, chunk_size = 1000)
    procurements = []
    min_id = 0

    loop do
      chunk = downloader.get_json_from_href('/v2/verejneObstaravania', limit: chunk_size, minId: min_id)
      break if chunk.empty?

      procurements.concat(chunk)
      min_id = chunk.last['id']
    end

    procurements
  end
end
