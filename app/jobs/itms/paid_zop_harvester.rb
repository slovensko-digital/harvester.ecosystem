require 'harvester_utils/downloader'

class Itms::PaidZopHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/v1/zop/uhradene?minId=#{min_id}&limit=100")

    json_response.each do |list_item_json|
      json = load_and_parse_relative_url(list_item_json['href'])

      Itms::PaidZop.transaction do
        begin
          zop = Itms::PaidZop.new
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
          save_zop_paid_for(json, zop)
          save_zop_recipient(json, zop)
          save_zop_project(json, zop)

          zop.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{zop.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::PaidZop)
  end

  private

  def save_zop_pre_financing(json, zop)
    financing_json = json['predfinancovanie']
    if financing_json.present?
      financing = zop.build_paid_zop_pre_financing
      financing[:itms_identifier] = financing_json['id']
    end
  end

  def save_zop_paid_for(json, zop)
    paid_for_json = json['predkladanaZa']
    if paid_for_json.present?
      paid_for = zop.build_paid_zop_submitted_for
      paid_for[:itms_identifier] = paid_for_json['id']
      paid_for[:dic] = paid_for_json['dic']
      paid_for[:ico] = paid_for_json['ico']
      paid_for[:ine_identifikacne_cislo] = paid_for_json['ineIdentifikacneCislo']
    end
  end

  def save_zop_recipient(json, zop)
    recipient_json = json['prijimatel']
    if recipient_json.present?
      recipient = zop.build_paid_zop_recipient
      recipient[:itms_identifier] = recipient_json['id']
      recipient[:dic] = recipient_json['dic']
      recipient[:ico] = recipient_json['ico']
      recipient[:ine_identifikacne_cislo] = recipient_json['ineIdentifikacneCislo']
    end
  end

  def save_zop_project(json, zop)
    project_json = json['projekt']
    if project_json.present?
      project = zop.build_paid_zop_project
      project[:itms_identifier] = project_json['id']
    end
  end
end
