require 'faraday'

class Metais::SyncDocumentJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/dms/file/meta/'
  NOT_FOUND_METADATA_TYPE = 'gnr404'

  def perform(parent, json)
    json = json['configurationItem']
    
    conn = Faraday.new(url: API_ENDPOINT)
    response = conn.get(json['uuid'], 'Content-Type' => 'application/json')
    meta = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      document = parent.documents.find_or_initialize_by(uuid: json['uuid'])
      return unless document.latest_version.nil? || 
        document.latest_version.raw_data != json.to_json ||
        (document.latest_version.raw_meta != meta.to_json &&
          !(meta['type'] == NOT_FOUND_METADATA_TYPE &&
             meta['type'] == JSON.parse(document.latest_version.raw_meta)['type'])
        )

      version = document.versions.build(raw_data: json.to_json, raw_meta: meta.to_json)
      parse_document(version, json, meta)
      document.save!
      version.save!
      document.latest_version = version
      document.save!
    end
  end

  private

  def parse_document(document_version, json, meta)
    document_version.nazov = get_document_attribute(json, 'Gen_Profil_nazov')
    document_version.poznamka = get_document_attribute(json, 'Gen_Profil_poznamka')
    document_version.typ = get_document_attribute(json, 'Profil_Dokument_Projekt_typ_dokumentu')
    document_version.kod_metais = get_document_attribute(json, 'Gen_Profil_kod_metais')
    document_version.ref_id = get_document_attribute(json, 'Gen_Profil_ref_id')

    document_version.filename = meta['filename']
    document_version.mimetype = meta['mimeType']
    document_version.size = meta['contentLength']
    document_version.stav_evidencie = meta['status']
    document_version.metais_created_at = meta['created']
    document_version.metais_updated_at = meta['lastModified']
  end

  def get_document_attribute(json, key)
    return json['attributes'].find { |a| a['name'] == key }&.dig('value')
  end
end
