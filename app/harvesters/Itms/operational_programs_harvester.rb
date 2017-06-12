require 'harvester_utils/downloader'

class Itms::OperationalProgramsHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/operacneProgramy?minId=#{min_id}&limit=100")

    json_response.each do |json|
      Itms::OperationalProgram.transaction do
        begin
          program = Itms::OperationalProgram.new
          program[:itms_identifier] = json['id']
          program[:created_at] = json['createdAt']
          program[:updated_at] = json['updatedAt']
          program[:kod] = json['kod']
          program[:kod_cci] = json['kodCCI']
          program[:nazov] = json['nazov']
          program[:skratka] = json['skratka']

          save_program_subject(json, program)
          load_and_save_priority_axes("/operacneProgramy/#{program.itms_identifier}/prioritneOsi")

          program.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{program.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::OperationalProgram)
  end

  private

  def save_program_subject(json, program)
    unit_json = json['subjekt']
    if unit_json.present?
      activity_unit = program.build_operational_program_unit
      activity_unit[:itms_identifier] = unit_json['id']
      activity_unit[:ico] = unit_json['ico']
      activity_unit[:ine_identifikacne_cislo] = unit_json['ineIdentifikacneCislo']
      load_and_save_unit(unit_json['href'])
    end
  end
end
