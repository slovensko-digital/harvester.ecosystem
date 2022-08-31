require 'faraday'

class Metais::SyncCodelistProjectStateJob < ApplicationJob
  queue_as :metais
  
  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/enumsrepository/enums/enum/all/STAV_PROJEKTU?lang=sk'
  
  def perform
    conn = Faraday.new(url: API_ENDPOINT)
    response = conn.get('', 'Content-Type' => 'application/json')
    parsed_json = JSON.parse(response.body)
  
    ActiveRecord::Base.transaction do
      parsed_json['enumItems'].each do |i|
        project_state = Metais::CodelistProjectState.find_or_initialize_by(code: i['code'])
        project_state.nazov = i['value']
        project_state.order_list = i['orderList']
        project_state.popis = i['description']
        project_state.save!
      end
    end
  end
end
