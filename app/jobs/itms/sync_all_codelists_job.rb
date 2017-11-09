require 'harvester_utils/downloader'

class Itms::SyncAllCodelistsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/ciselniky')
    codelists_json = JSON.parse(response.body)

    codelists_json.map do |json|
      ActiveRecord::Base.transaction do
        c = Itms::Codelist.find_or_initialize_by(ciselnik_kod: json['ciselnikKod'])
        c.nazov = json['nazov']
        c.popis = json['popis']
        c.save!
      end

      Itms::SyncCodelistValuesJob.perform_later(json['ciselnikKod'])
    end
  end
end
