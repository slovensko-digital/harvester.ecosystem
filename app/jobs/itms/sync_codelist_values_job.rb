require 'harvester_utils/downloader'

class Itms::SyncCodelistValuesJob < ItmsJob
  def perform(codelist_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/hodnotaCiselnika/#{codelist_id}")
    codelist_values_json = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      codelist = Itms::Codelist.find_by!(ciselnik_kod: codelist_id)

      codelist_values_json.map do |json|
        cv = Itms::CodelistValue.find_or_initialize_by(ciselnik: codelist, itms_id: json['id'])
        cv.itms_href = json['href']
        cv.kod = json['kod']
        cv.kod_zdroj = json['kodZdroj']
        cv.nazov = json['nazov']
        cv.platnost_do = json['platnostDo']
        cv.platnost_od = json['platnostOd']
        cv.popis = json['popis']
        
        cv.save!
      end
    end
  end
end
