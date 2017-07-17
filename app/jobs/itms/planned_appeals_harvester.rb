require 'harvester_utils/downloader'

class Itms::PlannedAppealsHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/v1/vyzvy/planovane?minId=#{min_id}&limit=100")

    json_response.each do |list_item_json|
      json = load_and_parse_relative_url(list_item_json['href'])

      Itms::PlannedAppeal.transaction do
        begin
          appeal = Itms::PlannedAppeal.new
          appeal[:itms_identifier] = json['id']
          appeal[:alokacia_eu] = json['alokaciaEU']
          appeal[:alokacia_sr] = json['alokaciaSR']
          appeal[:druh] = json['druh']
          appeal[:kod] = json['kod']
          appeal[:nazov] = json['nazov']
          appeal[:stav] = json['stav']
          appeal[:typ1_kolo] = json['typ1Kolo']
          appeal[:typ2_kolo] = json['typ2Kolo']
          appeal[:datum_uzavretia1_kolo] = json['datumUzavretia1Kolo']
          appeal[:datum_uzavretia2_kolo] = json['datumUzavretia2Kolo']
          appeal[:datum_vyhlasenia1_kolo] = json['datumVyhlasenia1Kolo']
          appeal[:datum_vyhlasenia2_kolo] = json['datumVyhlasenia2Kolo']
          appeal[:updated_at] = json['updatedAt']
          appeal[:created_at] = json['createdAt']

          save_appeal_planned_info(json, appeal)
          save_appeal_goals(json, appeal)
          save_appeal_providers(json, appeal)
          save_appeal_announcer(json, appeal)

          appeal.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{appeal.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::PlannedAppeal)
  end

  private

  def save_appeal_planned_info(json, appeal)
    Array(json['doplnujuceInfo']).each do |info_json|
      info = appeal.planned_appeal_info.new
      info[:nazov] = info_json['nazov']
      info[:url] = info_json['url']
    end
  end

  def save_appeal_goals(json, appeal)
    Array(json['konkretneCiele']).each do |goal_info|
      goal = appeal.planned_appeal_goals.new
      goal[:itms_identifier] = goal_info['id']
      load_and_save_specific_goal(goal_info['href'])
    end
  end

  def save_appeal_providers(json, appeal)
    Array(json['poskytovatelia']).each do |provider_json|
      provider = appeal.planned_appeal_providers.new
      provider[:itms_identifier] = provider_json['id']
      provider[:ico] = provider_json['ico']
      provider[:ine_identifikacne_cislo] = provider_json['ineIdentifikacneCislo']
    end
  end

  def save_appeal_announcer(json, appeal)
    announcer_json = json['vyhlasovatel']
    if announcer_json.present?
      announcer = appeal.build_planned_appeal_announcer
      announcer[:itms_identifier] = announcer_json['id']
      announcer[:ico] = announcer_json['ico']
      announcer[:ine_identifikacne_cislo] = announcer_json['ineIdentifikacneCislo']
    end
  end
end
