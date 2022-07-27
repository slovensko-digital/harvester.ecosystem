require 'faraday'

class Metais::SyncDocumentJob < ApplicationJob
  queue_as :metais

  def perform(parent, json)
    json = json['configurationItem']

    document = Metais::Document.find_or_create_by(uuid: json['uuid'], :attachable => parent)

    document.raw_data = json.to_json
    document.save!

    conn = Faraday.new(url: 'https://metais.vicepremier.gov.sk/dms/file/meta/')
    response = conn.get(json['uuid'], 'Content-Type' => 'application/json')

    if response.status == 200
      document.raw_meta = JSON.parse(response.body)
      document.save!
    end

    parse_document(document)
  end

  private

  def parse_document(document)
    # TODO: parse document
  end
end
