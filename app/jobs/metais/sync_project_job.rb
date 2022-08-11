class Metais::SyncProjectJob < ApplicationJob
  queue_as :metais
  
  def perform(json)
    uuid = json['uuid']
    return unless uuid

    project = Metais::Project.find_or_initialize_by(uuid: uuid)
    process_project(project, json)

    Metais::SyncProjectsIsvsJob.perform_later(project)
    Metais::SyncRelatedDocumentsJob.perform_later(project)
  end

  private

  def process_project(project, json)
    ActiveRecord::Base.transaction do
      return unless project.latest_version.nil? || project.latest_version.raw_data != json.to_json

      version = project.versions.build(raw_data: json.to_json)
      parse_project(version, json)
      project.save!
      version.save!
      project.latest_version = version
      project.save!
    end
  end

  def parse_project(p, json)
    p.nazov = get_projects_attribute(json, 'Gen_Profil_nazov')
    p.popis = get_projects_attribute(json, 'Gen_Profil_popis')
    p.datum_zacatia = get_projects_attribute(json, 'EA_Profil_Projekt_datum_zacatia')
    p.termin_ukoncenia = get_projects_attribute(json, 'EA_Profil_Projekt_termin_ukoncenia')
    p.schvalovaci_proces = get_projects_attribute(json, 'EA_Profil_Projekt_schvalovaci_proces')
    p.kod_metais = get_projects_attribute(json, 'Gen_Profil_kod_metais')
    p.typ_investicie = get_projects_attribute(json, 'EA_Profil_Projekt_typ_investicie')
    p.zdroj = get_projects_attribute(json, 'Gen_Profil_zdroj')
    p.financna_skupina = get_projects_attribute(json, 'Financny_Profil_Projekt_financna_skupina')
    p.prijimatel = get_projects_attribute(json, 'EA_Profil_Projekt_prijimatel')
    p.faza_projektu = get_projects_attribute(json, 'EA_Profil_Projekt_faza_projektu')
    p.suma_vydavkov = get_projects_attribute(json, 'Financny_Profil_Projekt_suma_vydavkov')
    p.rocne_naklady = get_projects_attribute(json, 'Financny_Profil_Projekt_rocne_naklady')
    p.ref_id = get_projects_attribute(json, 'Gen_Profil_ref_id')
    p.program = get_projects_attribute(json, 'EA_Profil_Projekt_program')
    p.stav = get_projects_attribute(json, 'EA_Profil_Projekt_status')

    p.zmena_stavu = get_projects_attribute(json, 'EA_Profil_Projekt_zmena_stavu')
    p.schvalene_rocne_naklady = get_projects_attribute(json, 'Financny_Profil_Projekt_schvalene_rocne_naklady')
    p.schvaleny_rozpocet = get_projects_attribute(json, 'Financny_Profil_Projekt_schvaleny_rozpocet')
    p.datum_nfp = get_projects_attribute(json, 'status_projetku_status_projektu_Datum_NFP')
    p.link_nfp = get_projects_attribute(json, 'status_projetku_status_projektu_link_NFP')
    p.vyhlasenie_vo = get_projects_attribute(json, 'status_projetku_status_projektu_vyhlasenie_VO')
    p.vo = get_projects_attribute(json, 'status_projetku_status_projektu_VO')
    p.zmluva_o_dielo = get_projects_attribute(json, 'status_projetku_status_projektu_zmluva_o_dielo')
    p.zmluva_o_dielo_crz = get_projects_attribute(json, 'status_projetku_status_projektu_zmluva_o_dielo_CRZ')
  end

  def get_projects_attribute(json, key)
    return json['attributes'].find { |a| a['name'] == key }&.dig('value')
  end
end