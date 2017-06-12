require 'harvester_utils/downloader'

class Itms::DeclaredAppealsHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/vyzvy/vyhlasene?minId=#{min_id}&limit=100")

    json_response.each do |json|
      Itms::DeclaredAppeal.transaction do
        begin
          appeal = Itms::DeclaredAppeal.new
          appeal[:itms_identifier] = json['id']
          appeal[:alokacia_eu] = json['alokaciaEU']
          appeal[:alokacia_sr] = json['alokaciaSR']
          appeal[:created_at] = json['created_at']
          appeal[:druh] = json['druh']
          appeal[:kod] = json['kod']
          appeal[:nazov] = json['nazov']
          appeal[:stav] = json['stav']
          appeal[:typ] = json['typ']
          appeal[:datum_uzavretia] = json['datumUzavretia']
          appeal[:datum_vyhlasenia] = json['datumVyhlasenia']
          appeal[:updated_at] = json['updatedAt']
          appeal[:created_at] = json['createdAt']
          appeal[:technicka_asistencia] = json['technickaAsistencia']

          save_appeal_info(json, appeal)
          save_appeal_goals(json, appeal) 
          save_appeal_providers(json, appeal)
          save_appeal_announcer(json, appeal)
          save_appeal_funds(json, appeal)
          save_appeal_contact_persons(json, appeal)
          save_appeal_planned_appeals(json, appeal)
          save_appeal_considered_periods(json, appeal)

          appeal.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{appeal.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::DeclaredAppeal)
  end

  private 

  def save_appeal_info(json, appeal)
    Array(json['doplnujuceInfo']).each do |info_json|
      info = appeal.declared_appeal_info.new
      info[:nazov] = info_json['nazov']
      info[:url] = info_json['url']
    end
  end

  def save_appeal_goals(json, appeal)
    Array(json['konkretneCiele']).each do |goal_info|
      goal = appeal.declared_appeal_goals.new
      goal[:itms_identifier] = goal_info['id']
      load_and_save_specific_goal(goal_info['href'])
    end
  end

  def save_appeal_providers(json, appeal)
    Array(json['poskytovatelia']).each do |provider_json|
      provider = appeal.declared_appeal_providers.new
      provider[:itms_identifier] = provider_json['id']
      provider[:ico] = provider_json['ico']
      provider[:ine_identifikacne_cislo] = provider_json['ineIdentifikacneCislo']
    end
  end

  def save_appeal_announcer(json, appeal)
    announcer_json = json['vyhlasovatel']
    if announcer_json.present?
      announcer = appeal.build_declared_appeal_announcer
      announcer[:itms_identifier] = announcer_json['id']
      announcer[:ico] = announcer_json['ico']
      announcer[:ine_identifikacne_cislo] = announcer_json['ineIdentifikacneCislo']
    end
  end

  def save_appeal_funds(json, appeal)
    Array(json['fondy']).each do |fund_json|
      fund = appeal.declared_appeal_funds.new
      fund[:nazov] = fund_json
    end
  end

  def save_appeal_contact_persons(json, appeal)
    Array(json['kontaktneOsoby']).each do |person_json|
      person = appeal.declared_appeal_contact_persons.new
      person[:itms_identifier] = person_json['id']
      person[:email] = person_json['email']
      person[:meno] = person_json['meno']
      person[:meno_uplne] = person_json['menoUplne']
      person[:priezvisko] = person_json['priezvisko']
      person[:telefon] = person_json['telefon']
    end
  end

  def save_appeal_planned_appeals(json, appeal)
    Array(json['planovaneVyzvy']).each do |planned_appeal_json|
      planned_appeal = appeal.declared_appeal_planned_appeals.new
      planned_appeal[:itms_identifier] = planned_appeal_json['id']
    end
  end

  def save_appeal_considered_periods(json, appeal)
    Array(json['posudzovaneObdobia']).each do |period_json|
      period = appeal.declared_appeal_considered_periods.new
      period[:datum_uzavierky] = period_json['datumUzavierky']
      period[:poradove_cislo] = period_json['poradoveCislo']
    end
  end
end
