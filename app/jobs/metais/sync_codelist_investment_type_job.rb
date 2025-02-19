require 'faraday'

class Metais::SyncCodelistInvestmentTypeJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.slovensko.sk/api/enums-repo/enums/enum/valid/TYP_INVESTICIE?lang=sk'

  def perform
    conn = Faraday.new(url: API_ENDPOINT)
    response = conn.get('', nil, {'Content-Type' => 'application/json', 'Accept-Language' => 'sk-SK,sk;q=0.8'})
    parsed_json = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      parsed_json['enumItems'].each do |i|
        investment_type = Metais::CodelistInvestmentType.find_or_initialize_by(code: i['code'])
        investment_type.nazov = i['value']
        investment_type.order_list = i['orderList']
        investment_type.popis = i['description']
        investment_type.save!
      end
    end
  end
end    
