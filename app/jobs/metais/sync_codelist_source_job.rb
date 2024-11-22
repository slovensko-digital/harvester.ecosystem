require 'faraday'

class Metais::SyncCodelistSourceJob < ApplicationJob
  queue_as :metais
  
  API_ENDPOINT = 'https://metais.slovensko.sk/api/enums-repo/enums/enum/valid/ZDROJ?lang=sk'
  
  def perform
    conn = Faraday.new(url: API_ENDPOINT)
    response = conn.get('', nil, {'Content-Type' => 'application/json', 'Accept-Language' => 'sk-SK,sk;q=0.8'})
    parsed_json = JSON.parse(response.body)
  
    ActiveRecord::Base.transaction do
      parsed_json['enumItems'].each do |i|
        source = Metais::CodelistSource.find_or_initialize_by(code: i['code'])
        source.nazov = i['value']
        source.order_list = i['orderList']
        source.popis = i['description']
        source.save!
      end
    end
  end
end
