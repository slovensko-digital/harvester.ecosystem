require 'faraday'

class Metais::SyncDocumentJob < ApplicationJob
  queue_as :metais

  def perform(parent, json)
    json = json['configurationItem']
    
    conn = Faraday.new(url: 'https://metais.vicepremier.gov.sk/dms/file/meta/')
    response = conn.get(json['uuid'], 'Content-Type' => 'application/json')
    meta = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      document = parent.dokumenty.find_or_initialize_by(uuid: json['uuid'])
      document.raw_data = json.to_json
      document.raw_meta = meta.to_json
      parse_document(document, json, meta)
      document.save!
    end
  end

  private

  def parse_document(document, json, meta)
    # TODO: parse document
  end
end
