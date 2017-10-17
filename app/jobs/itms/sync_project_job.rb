require 'harvester_utils/downloader'

class Itms::SyncProjectJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    _, _, _, _, itms_id = itms_href.split('/')

    ActiveRecord::Base.transaction do
      p = Itms::Project.find_or_initialize_by(itms_id: itms_id)
      p.itms_href = json['href']
      p.itms_created_at = json['createdAt']
      p.itms_updated_at = json['updatedAt']
      p.save!

      p.akronym = json['akronym']
      #TODO p.aktivity = json['aktivity']
      p.cislo_zmluvy = json['cisloZmluvy']
      #TODO p.data_projektu = json['dataProjektu']
      p.datum_konca_hlavnych_aktivit = json['datumKoncaHlavnychAktivit']
      p.datum_konca_realizacie = json['datumKoncaRealizacie']
      p.datum_platnosti_zmluvy = json['datumPlatnostiZmluvy']
      p.datum_ucinnosti_zmluvy = json['datumUcinnostiZmluvy']
      p.datum_zaciatku_hlavnych_aktivit = json['datumZaciatkuHlavnychAktivit']
      p.datum_zaciatku_realizacie = json['datumZaciatkuRealizacie']
      p.dlzka_celkova_hlavnych_aktivit = json['dlzkaCelkovaHlavnychAktivit']
      p.dlzka_celkova_projektu = json['dlzkaCelkovaProjektu']
      #TODO p.formy_financovania = json['formyFinancovania']
      #TODO p.hospodarske_cinnosti = json['hospodarskeCinnosti']
      #TODO p.intenzity = json['intenzity']
      p.kod = json['kod']
      #TODO p.meratelne_ukazovatele = json['meratelneUkazovatele']
      #TODO p.miesta_realizacie = json['miestaRealizacie']
      #TODO p.monitorovacie_terminy = json['monitorovacieTerminy']
      p.nazov = json['nazov']
      #TODO p.oblasti_intervencie = json['oblastiIntervencie']
      #TODO p.organizacne_zlozky = json['organizacneZlozky']
      p.otvorena_zmena = json['otvorenaZmena']
      p.otvoreny_dodatok = json['otvorenyDodatok']
      #TODO p.partneri = json['partneri']
      #TODO p.polozky_rozpoctu = json['polozkyRozpoctu']
      p.popis_projektu = json['popisProjektu']
      p.prijimatel = find_or_create_subject_by_json(json['prijimatel'], downloader)
      #TODO p.schvalena_zonfp = json['schvalenaZonfp']
      #TODO p.sekundarny_tematicky_okruh = json['sekundarnyTematickyOkruh']
      p.stav = json['stav']
      p.suma_celkova_projektov_generujucich_prijem = json['sumaCelkovaProjektovGenerujucichPrijem']
      p.suma_zazmluvnena = json['sumaZazmluvnena']
      p.suma_zazmluvnena_povodna = json['sumaZazmluvnenaPovodna']
      #TODO p.typy_uzemia = json['typyUzemia']
      p.url_adresa_zmluva = json['urlAdresaZmluva']
      #TODO p.uzemne_mechanizmy = json['uzemneMechanizmy']
      #TODO p.vyzva = json['vyzva']
      p.zameranie_projektu = json['zameranieProjektu']

      p.save!
    end
  end
end