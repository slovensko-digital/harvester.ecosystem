require 'faraday'

class Metais::SyncCodelistProjectPhaseJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/enumsrepository/enums/enum/all/FAZA_PROJEKTU?lang=sk'

  def perform
    conn = Faraday.new(url: API_ENDPOINT)
    response = conn.get('', 'Content-Type' => 'application/json')
    parsed_json = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      parsed_json['enumItems'].each do |i|
        project_phase = Metais::CodelistProjectPhase.find_or_initialize_by(code: i['code'])
        project_phase.nazov = i['value']
        project_phase.order_list = i['orderList']
        project_phase.popis = i['description']
        project_phase.save!
      end
    end
  end
end
