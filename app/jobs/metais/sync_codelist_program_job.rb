class Metais::SyncCodelistProgramJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.slovensko.sk/api/cmdb/read/cilistfiltered'
  REQUEST_BODY = '{"filter":{"type":["Program"],"metaAttributes":{"state":["DRAFT"]}},"page":1,"perpage":10000,"sortBy":"Gen_Profil_nazov","sortType":"ASC"}'

  def perform
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1

    begin
      response = conn.post('', REQUEST_BODY, 'Content-Type' => 'application/json')
      parsed_json = JSON.parse(response.body)

      ActiveRecord::Base.transaction do
        parsed_json['configurationItemSet'].each do |i|
          program = Metais::CodelistProgram.find_or_initialize_by(kod_metais: get_attribute(i, 'Gen_Profil_kod_metais'))
          program.uuid = i&.dig('uuid')
          program.nazov = get_attribute(i, 'Gen_Profil_nazov')
          program.nazov_en = get_attribute(i, 'Gen_Profil_anglicky_nazov')
          program.ref_id = get_attribute(i, 'Gen_Profil_ref_id')
          program.zdroj = get_attribute(i, 'Gen_Profil_zdroj')
          program.raw_data = i.to_json
          program.save!
        end
      end

      page_number += 1
    end while  page_number <= parsed_json['pagination']['totalPages']
  end

  def get_attribute(json, key)
    return json['attributes'].find { |a| a['name'] == key }&.dig('value')
  end
end
