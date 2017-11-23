class Itms::SyncIntensityJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      i = Itms::Intensity.find_or_create_by!(itms_id: json['id'])
      i.itms_href = json['href']

      i.nazov = json['nazov']
      i.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      i.zdroj_eu = find_or_create_intensity_source(json['zdrojEu'], i.zdroj_eu, downloader)
      i.zdroj_pr = find_or_create_intensity_source(json['zdrojPr'], i.zdroj_pr, downloader)
      i.zdroj_sr = find_or_create_intensity_source(json['zdrojSr'], i.zdroj_sr, downloader)
      i.zdroj_vz = find_or_create_intensity_source(json['zdrojVz'], i.zdroj_vz, downloader)
      i.zdroj_yei = find_or_create_intensity_source(json['zdrojYei'], i.zdroj_yei, downloader)

      i.save!
    end
  end

  private

  def find_or_create_intensity_source(json, current_source, downloader)
    if json.blank?
      current_source.destroy! if current_source.present?
      return
    end

    is = current_source || Itms::IntensitySource.new
    is.cerpanie_eu = json['cerpanieEu'] ? json['cerpanieEu'].to_d : nil
    is.cerpanie_ro = json['cerpanieRo'] ? json['cerpanieRo'].to_d : nil
    is.percento = json['percento'] ? json['percento'].to_d : nil
    is.suma_zazmluvnena = json['sumaZazmluvnena'] ? json['sumaZazmluvnena'].to_d : nil
    is.zdroj = find_or_create_codelist_value_by_json(json['zdroj'], downloader)
    is.save!

    is
  end
end
