require 'faraday'

class Metais::SyncCodelistProjectStateJob < ApplicationJob
  queue_as :metais
  
  API_ENDPOINT = 'https://metais.slovensko.sk/api/enums-repo/enums/enum/valid/STAV_PROJEKTU?lang=sk'
  
  def perform
    conn = Faraday.new(url: API_ENDPOINT)
    response = conn.get('', nil, {'Content-Type' => 'application/json', 'Accept-Language' => 'sk-SK,sk;q=0.8'})
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
