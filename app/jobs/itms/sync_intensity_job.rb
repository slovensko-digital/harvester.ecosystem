require 'harvester_utils/downloader'

class Itms::SyncIntensityJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      i = Itms::Intensity.find_or_initialize_by(itms_id: itms_id)
      i.itms_href = json['href']
      i.save!

      i.nazov = json['nazov']
      i.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      i.zdroj_eu = find_or_create_intensity_source_by_json(json['zdrojEu'])
      i.zdroj_pr = find_or_create_intensity_source_by_json(json['zdrojPr'])
      i.zdroj_sr = find_or_create_intensity_source_by_json(json['zdrojSr'])
      i.zdroj_vz = find_or_create_intensity_source_by_json(json['zdrojVz'])
      i.zdroj_yei = find_or_create_intensity_source_by_json(json['zdrojYei'])

      i.save!
    end
  end

  private

  def find_or_create_intensity_source_by_json(json)
    return if json.blank?
    Itms::IntensitySource.find_or_create_by!(
        cerpanie_eu: json['cerpanieEu'] ? json['cerpanieEu'].to_d : nil,
        cerpanie_ro: json['cerpanieRo'] ? json['cerpanieRo'].to_d : nil,
        zdroj_id: json['id'],
        kod: json['kod'],
        nazov: json['nazov'],
        percento: json['percento'] ? json['percento'].to_d : nil,
        suma_zazmluvnena: json['sumaZazmluvnena'] ? json['sumaZazmluvnena'].to_d : nil,
    )
  end
end
