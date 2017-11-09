require 'harvester_utils/downloader'

class Itms::SyncCodelistJob < ItmsJob
  def perform(codelist_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/ciselniky')
    codelists_json = JSON.parse(response.body)

    json = codelists_json.find { |codelist_json| codelist_json['ciselnikKod'] == codelist_id }

    ActiveRecord::Base.transaction do
      c = Itms::Codelist.find_or_initialize_by(ciselnik_kod: json['ciselnikKod'])
      c.nazov = json['nazov']
      c.popis = json['popis']
      c.save!
    end
  end
end
