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
      i.zdroj_eu = find_or_create_intensity_source(i.zdroj_eu, json['zdrojEu'], downloader)
      i.zdroj_pr = find_or_create_intensity_source(i.zdroj_pr, json['zdrojPr'], downloader)
      i.zdroj_sr = find_or_create_intensity_source(i.zdroj_sr, json['zdrojSr'], downloader)
      i.zdroj_vz = find_or_create_intensity_source(i.zdroj_vz, json['zdrojVz'], downloader)
      i.zdroj_yei = find_or_create_intensity_source(i.zdroj_yei, json['zdrojYei'], downloader)

      i.save!
    end
  end

  private

  def find_or_create_intensity_source(current_id, json, downloader)
    if current_id.present? && json.blank?
      Itms::IntensitySource.find(current_id).destroy!
      return
    end

    return if json.blank?

    is = Itms::IntensitySource.find_or_initialize_by(id: current_id)
    is.cerpanie_eu = json['cerpanieEu'] ? json['cerpanieEu'].to_d : nil
    is.cerpanie_ro = json['cerpanieRo'] ? json['cerpanieRo'].to_d : nil
    is.percento = json['percento'] ? json['percento'].to_d : nil
    is.suma_zazmluvnena = json['sumaZazmluvnena'] ? json['sumaZazmluvnena'].to_d : nil
    is.zdroj = find_or_create_codelist_value_by_json(json['zdroj'], downloader)
    is.save!

    is
  end
end
