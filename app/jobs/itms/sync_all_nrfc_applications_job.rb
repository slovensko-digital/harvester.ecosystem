class Itms::SyncAllNrfcApplicationsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_nrfc_application_timestamp)
    json = downloader.get_json_from_href('/v2/zonfp/prijate', modifiedSince: modified_since)
    json.each { |item| Itms::SyncNrfcApplicationJob.perform_later(item['href']) }
  end

  def latest_nrfc_application_timestamp
    [Itms::NrfcApplicationReceived.latest&.itms_updated_at, Itms::NrfcApplicationProcessed.latest&.itms_updated_at].min&.to_i
  end
end
