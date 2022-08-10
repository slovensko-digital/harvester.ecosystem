require 'faraday'

class Metais::SyncDocumentJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/dms/file/meta/'

  def perform(parent, json)
    json = json['configurationItem']
    
    conn = Faraday.new(url: API_ENDPOINT)
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
    document.nazov = get_document_attribute(json, 'Gen_Profil_nazov')
    document.poznamka = get_document_attribute(json, 'Gen_Profil_poznamka')
    document.typ = get_document_attribute(json, 'Profil_Dokument_Projekt_typ_dokumentu')
    document.kod_metais = get_document_attribute(json, 'Gen_Profil_kod_metais')
    document.ref_id = get_document_attribute(json, 'Gen_Profil_ref_id')

    document.filename = meta['filename']
    document.mimetype = meta['mimeType']
    document.size = meta['contentLength']
    document.stav_evidencie = meta['status']
    document.metais_created_at = meta['created']
    document.metais_updated_at = meta['lastModified']
  end

  def get_document_attribute(json, key)
    return json['attributes'].find { |a| a['name'] == key }&.dig('value')
  end
end
