require 'harvester_utils/downloader'

class Itms::RejectedZopHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/zop/zamietnute?minId=#{min_id}&limit=100")

    json_response.each do |json|
      Itms::RejectedZop.transaction do
        begin
          zop = Itms::RejectedZop.new
          zop[:itms_identifier] = json['id']
          zop[:created_at] = json['createdAt']
          zop[:datum_prijatia] = json['datumPrijatia']
          zop[:kod] = json['kod']
          zop[:narokovana_suma] = json['narokovanaSuma']
          zop[:typ] = json['typ']
          zop[:updated_at] = json['updatedAt']
          zop[:vyplaca_sa_partnerovi] = json['vyplacaSaPartnerovi']
          zop[:zop_je_zaverecna] = json['zopJeZaverecna']

          save_zop_pre_financing(json, zop)
          save_zop_submitted_for(json, zop)
          save_zop_recipient(json, zop)
          save_zop_project(json, zop)

          zop.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{zop.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::RejectedZop)
  end

  private

  def save_zop_pre_financing(json, zop)
    financing_json = json['predfinancovanie']
    if financing_json.present?
      financing = zop.build_rejected_zop_pre_financing
      financing[:itms_identifier] = financing_json['id']
    end
  end

  def save_zop_submitted_for(json, zop)
    rejected_for_json = json['predkladanaZa']
    if rejected_for_json.present?
      rejected_for = zop.build_rejected_zop_submitted_for
      rejected_for[:itms_identifier] = rejected_for_json['id']
      rejected_for[:dic] = rejected_for_json['dic']
      rejected_for[:ico] = rejected_for_json['ico']
      rejected_for[:ine_identifikacne_cislo] = rejected_for_json['ineIdentifikacneCislo']
    end
  end

  def save_zop_recipient(json, zop)
    recipient_json = json['prijimatel']
    if recipient_json.present?
      recipient = zop.build_rejected_zop_recipient
      recipient[:itms_identifier] = recipient_json['id']
      recipient[:dic] = recipient_json['dic']
      recipient[:ico] = recipient_json['ico']
      recipient[:ine_identifikacne_cislo] = recipient_json['ineIdentifikacneCislo']
    end
  end

  def save_zop_project(json, zop)
    project_json = json['projekt']
    if project_json.present?
      project = zop.build_rejected_zop_project
      project[:itms_identifier] = project_json['id']
    end
  end
end
