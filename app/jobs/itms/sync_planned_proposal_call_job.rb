require 'harvester_utils/downloader'

class Itms::SyncPlannedProposalCallJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      ppc = Itms::PlannedProposalCall.find_or_create_by!(itms_id: itms_id)
      ppc.itms_href = json['href']
      ppc.itms_created_at = json['createdAt']
      ppc.itms_updated_at = json['updatedAt']

      ppc.alokacia_eu = json['alokaciaEU']
      ppc.alokacia_sr = json['alokaciaSR']
      ppc.datum_uzavretia_1_kolo = json['datumUzavretia1Kolo']
      ppc.datum_uzavretia_2_kolo = json['datumUzavretia2Kolo']
      ppc.datum_vyhlasenia_1_kolo = json['datumVyhlasenia1Kolo']
      ppc.datum_vyhlasenia_2_kolo = json['datumVyhlasenia2Kolo']
      ppc.doplnujuce_info = find_or_create_additional_info_by_json(json['doplnujuceInfo'], ppc.doplnujuce_info)
      ppc.druh = json['druh']
      ppc.kod = json['kod']
      ppc.konkretne_ciele = find_or_create_specific_goals_by_json(json['konkretneCiele'], downloader)
      ppc.nazov = json['nazov']
      ppc.poskytovatelia = find_or_create_subjects_by_json(json['poskytovatelia'], downloader)
      ppc.stav = json['stav']
      ppc.typ_1_kolo = json['typ1Kolo']
      ppc.typ_2_kolo = json['typ2Kolo']
      ppc.vyhlasovatel = find_or_create_subject_by_json(json['vyhlasovatel'], downloader)
      ppc.save!
    end
  end

  private

  def find_or_create_additional_info_by_json(json, scope)
    return [] if json.blank?
    json.map do |j|
      scope.find_or_create_by!(nazov: j['nazov'], url: j['url'])
    end
  end
end
