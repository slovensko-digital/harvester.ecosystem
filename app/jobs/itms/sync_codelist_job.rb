class Itms::SyncCodelistJob < ItmsJob
  def perform(codelist_id, downloader: ItmsJob::Downloader)
    codelists_json = downloader.get_json_from_href('/v2/ciselniky')
    json = codelists_json.find { |codelist_json| codelist_json['ciselnikKod'] == Integer(codelist_id) }

    ActiveRecord::Base.transaction do
      c = Itms::Codelist.find_or_create_by!(ciselnik_kod: json['ciselnikKod'])
      c.nazov = json['nazov']
      c.popis = json['popis']
      c.save!
    end
  end
end
