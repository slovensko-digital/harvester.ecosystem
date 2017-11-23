class Itms::SyncAllProcurementsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json_list = downloader.get_json_from_href('/v2/verejneObstaravania')
    json_list.map do |json|
      Itms::SyncProcurementJob.perform_later(json['href'])
    end
  end
end
