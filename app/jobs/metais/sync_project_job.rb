class Metais::SyncProjectJob < ApplicationJob
  queue_as :metais
  
  def perform(json)
    uuid = json['uuid']
    if !uuid
      return
    end

    project = Metais::Project.find_or_create_by(uuid: uuid)
    project.raw_data = json.to_json
    project.save!

    Metais::SyncProjectsIsvsJob.perform_later(project)
    Metais::SyncRelatedDocumentsJob.perform_later(project)

    parse_project(project, json)
  end

  private

  def parse_project(p, json)
    p.nazov = get_projects_attribute(json, 'Gen_Profil_nazov')
    p.popis = get_projects_attribute(json, 'Gen_Profil_popis')
    p.datum_zaciatku = get_projects_attribute(json, 'EA_Profil_Projekt_datum_zacatia')
    p.datum_ukoncenia = get_projects_attribute(json, 'EA_Profil_Projekt_termin_ukoncenia')
    p.schvalovaci_proces = get_projects_attribute(json, 'EA_Profil_Projekt_schvalovaci_proces')
    p.kod_metais = get_projects_attribute(json, 'Gen_Profil_kod_metais')
    p.typ_investicie = get_projects_attribute(json, 'EA_Profil_Projekt_typ_investicie')
    p.zdroj = get_projects_attribute(json, 'Gen_Profil_zdroj')
    p.financna_skupina = get_projects_attribute(json, 'Financny_Profil_Projekt_financna_skupina')
    p.prijimatel = get_projects_attribute(json, 'EA_Profil_Projekt_prijimatel')
    p.faza = get_projects_attribute(json, 'EA_Profil_Projekt_faza_projektu')
    p.naklady_spolu = get_projects_attribute(json, 'Financny_Profil_Projekt_suma_vydavkov')
    p.prevadzka_rocne = get_projects_attribute(json, 'Financny_Profil_Projekt_rocne_naklady')
    p.ref_id = get_projects_attribute(json, 'Gen_Profil_ref_id')
    p.program = get_projects_attribute(json, 'EA_Profil_Projekt_program')
    p.status = get_projects_attribute(json, 'EA_Profil_Projekt_status')

    p.datum_zmeny_stavu_projektu = get_projects_attribute(json, 'EA_Profil_Projekt_zmena_stavu')
    p.schvalena_prevadzka_rocne = get_projects_attribute(json, 'Financny_Profil_Projekt_schvalene_rocne_naklady')
    p.schvalene_naklady_spolu = get_projects_attribute(json, 'Financny_Profil_Projekt_schvaleny_rozpocet')
    p.datum_ucinnosti_zmluvy_nfp = get_projects_attribute(json, 'status_projetku_status_projektu_Datum_NFP')
    p.link_nfp_v_crz = get_projects_attribute(json, 'status_projetku_status_projektu_link_NFP')
    p.datum_zverejnenia_vo = get_projects_attribute(json, 'status_projetku_status_projektu_vyhlasenie_VO')
    p.link_vvo = get_projects_attribute(json, 'status_projetku_status_projektu_VO')
    p.datum_ucinnosti_zmluvy_dielo = get_projects_attribute(json, 'status_projetku_status_projektu_zmluva_o_dielo')
    p.link_dielo_v_crz = get_projects_attribute(json, 'status_projetku_status_projektu_zmluva_o_dielo_CRZ')

    p.parsed = true
    p.save!
  end

  def get_projects_attribute(json, key)
    return json['attributes'].find { |a| a['name'] == key }&.dig('value')
  end
end