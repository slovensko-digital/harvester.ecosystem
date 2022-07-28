require 'faraday'

class Metais::SyncDocumentJob < ApplicationJob
  queue_as :metais

  def perform(parent, json)
    json = json['configurationItem']
    
    conn = Faraday.new(url: 'https://metais.vicepremier.gov.sk/dms/file/meta/')
    response = conn.get(json['uuid'], 'Content-Type' => 'application/json')
    meta = JSON.parse(response.body)

    begin ActiveRecord::Base.transaction do
      document = Metais::Document.find_or_create_by(uuid: json['uuid'], :attachable => parent)
      document.raw_data = json.to_json
      document.raw_meta = JSON.parse(meta.body)
      parse_document(document, json, JSON.parse(meta.body))
      document.save!
    end
  end

  private

  def parse_document(document, json, meta)
    # TODO: parse document
  end
end
