require 'harvester_utils/downloader'

class Itms::SyncBudgetItemJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      bi = Itms::BudgetItem.find_or_create_by!(itms_id: itms_id)
      bi.itms_href = json['href']

      bi.aktivita = find_or_create_activity_by_json(json['aktivita'], downloader)
      bi.intenzita = find_or_create_intensity_by_json(json['intenzita'], downloader)
      bi.skupina_vydavkov = find_or_create_codelist_value_by_json(json['skupinaVydavkov'], downloader)
      bi.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      bi.viazana_suma = json['viazanaSuma']
      bi.volne_prostriedky = json['volneProstriedky']
      bi.vratena_suma = json['vratenaSuma']
      bi.zazmluvnena_suma = json['zazmluvnenaSuma']
      bi.save!
    end
  end
end
