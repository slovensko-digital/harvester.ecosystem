class Itms::Harvester

  class ApiError < StandardError; end
  
  attr_reader :min_id, :downloader

  def self.run(min_id: 0, downloader: HarvesterUtils::Downloader)
    new(min_id, downloader).run
  end

  def initialize(min_id, downloader)
    @min_id = min_id
    @downloader = downloader
  end

  def load_and_parse_endpoint(endpoint)
    response = downloader.get(endpoint)
    handle_api_response(response)
  end

  def handle_api_response(response)
    if response.response_code == 200
      JSON.parse(response.body)
    else
      raise(::Itms::Harvester::ApiError, 'API not available')
    end
  end

  def rerun_if_necessary(response, object_class)
    return if response.count.zero?
    last_response_id = response.last['id']

    unless last_response_id.to_i.zero?
      @min_id = last_response_id
      run
    end
  end

  def load_and_save_specific_goal(href)
    response = downloader.get("https://opendata.itms2014.sk#{href}")
    json = handle_api_response(response)

    specific_goal = Itms::SpecificGoal.find_or_initialize_by(itms_identifier: json['id'])
    specific_goal[:created_at] = json['createdAt']
    specific_goal[:updated_at] = json['updatedAt']
    specific_goal[:fond] = json['fond']
    specific_goal[:kategoria_regionov] = json['kategoriaRegionov']
    specific_goal[:kod] = json['kod']
    specific_goal[:nazov] = json['nazov']
    specific_goal[:technicka_asistencia] = json['technickaAsistencia']

    axis_json = json['prioritnaOs']
    if axis_json.present?
      axis = specific_goal.specific_goal_priority_axis
      axis ||= specific_goal.build_specific_goal_priority_axis
      axis[:itms_identifier] = axis_json['id']
      load_and_save_priority_axis(axis_json['href'])
    end

    specific_goal.save!
  end

  def load_and_save_priority_axis(href)
    response = downloader.get("https://opendata.itms2014.sk#{href}")

    save_axis(handle_api_response(response))
  end

  def load_and_save_priority_axes(href)
    response = downloader.get("https://opendata.itms2014.sk#{href}")

    handle_api_response(response).each do |axis_json|
      save_axis(axis_json)
    end
  end

  def save_axis(json)

    priority_axis = Itms::PriorityAxis.find_or_initialize_by(itms_identifier: json['id'])
    priority_axis[:created_at] = json['createdAt']
    priority_axis[:updated_at] = json['updatedAt']
    priority_axis[:kod] = json['kod']
    priority_axis[:nazov] = json['nazov']

    program_json = json['operacnyProgram']
    if program_json.present?
      program = priority_axis.priority_axis_operation_program
      program ||= priority_axis.build_priority_axis_operation_program
      program['itms_identifier'] = program_json['id']
    end

    priority_axis.save!
  end

  def load_and_save_unit(href)
    response = downloader.get("https://opendata.itms2014.sk#{href}")
    json = handle_api_response(response)

    unit = Itms::Unit.find_or_initialize_by(itms_identifier: json['id'])
    unit[:created_at] = json['createdAt']
    unit[:updated_at] = json['updatedAt']
    unit[:dic] = json['dic']
    unit[:ico] = json['ico']
    unit[:nazov] = json['nazov']
    unit[:ine_identifikacne_cislo] = json['ineIdentifikacneCislo']

    unit.save!
  end

  def load_and_save_supplier(href)
    response = downloader.get("https://opendata.itms2014.sk#{href}")
    json = handle_api_response(response)

    supplier = Itms::Supplier.find_or_initialize_by(itms_identifier: json['id'])
    supplier[:dic] = json['dic']
    supplier[:ico] = json['ico']
    supplier[:ine_identifikacne_cislo] = json['ineIdentifikacneCislo']
    supplier[:nazov] = json['nazov']
    supplier[:created_at] = json['createdAt']
    supplier[:updated_at] = json['updatedAt']

    supplier.save!
  end
end
