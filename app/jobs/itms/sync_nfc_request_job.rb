require 'harvester_utils/downloader'

class Itms::SyncNfcRequestJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    # response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    # json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      nfcr = Itms::NfcRequest.find_or_initialize_by(itms_id: itms_id)
      nfcr.save!
    end
  end
end