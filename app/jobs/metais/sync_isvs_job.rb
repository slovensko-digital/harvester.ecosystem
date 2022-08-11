class Metais::SyncIsvsJob < ApplicationJob
  queue_as :metais

  def perform(project, json)
    isvs_uuid = json['ci']['uuid']

    isvs = project.isvs.find_or_initialize_by(uuid: isvs_uuid)
    process_isvs(isvs, json['ci'])

    Metais::SyncRelatedDocumentsJob.perform_later(isvs)
  end

  private

  def process_isvs(isvs, json)
    ActiveRecord::Base.transaction do
      return unless isvs.latest_version.nil? || isvs.latest_version.raw_data != json.to_json
      
      version = isvs.versions.build(raw_data: json.to_json)
      parse_isvs(version, json)
      isvs.save!
      version.save!
      isvs.latest_version = version
      isvs.save!
    end
  end

  def parse_isvs(isvs, json)
    isvs.nazov = get_attribute(json, 'Gen_Profil_nazov')
    isvs.kod_metais = get_attribute(json, 'Gen_Profil_kod_metais')
    isvs.ref_id = get_attribute(json, 'Gen_Profil_ref_id')
    isvs.popis = get_attribute(json, 'Gen_Profil_popis')
    isvs.poznamka = get_attribute(json, 'Gen_Profil_poznamka')
    isvs.zdroj = get_attribute(json, 'Gen_Profil_zdroj')
    isvs.popis_as_is = get_attribute(json, 'EA_Profil_ISVS_popis_as_is')
    isvs.stav = get_attribute(json, 'EA_Profil_ISVS_stav_isvs')
    isvs.typ = get_attribute(json, 'EA_Profil_ISVS_typ_isvs')
  end

  def get_attribute(json, key)
    return json['attributes'].find { |a| a['name'] == key }&.dig('value')
  end
end
