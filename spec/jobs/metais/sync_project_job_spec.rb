require 'rails_helper'

RSpec.describe Metais::SyncProjectJob, type: :job do
  include ActiveJob::TestHelper

  before do
    clear_enqueued_jobs
  end

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    context "with no previous project data" do
      let(:project_version) { build(:metais_project_version) }

      it 'saves project and queues another jobs' do
        expect {
          subject.perform(JSON.parse(project_version.raw_data))
        }.to change(Metais::Project, :count).by(1)

        expect(Metais::Project.last).to have_attributes(
          latest_version: Metais::ProjectVersion.last,
          uuid: "372a7fe0-b8a8-42c8-b4c2-b2c77151ff49",
        )

        expect(Metais::ProjectVersion.last).to have_attributes(
          project: Metais::Project.last,
          nazov: "Centrálny ekonomický systém - HW a SW infraštruktúra - 2.fáza",
          kod_metais: "projekt_1800",
          typ_investicie: "c_projekt",
          prijimatel: "DataCentrum",
          faza_projektu: "c_faza_projektu.3",
          program: "cbb58995-4588-4fec-ab49-f491ba95f223",
          popis: "Projekt nadväzuje na projekt \"Centrálny ekonomický systém - HW a SW infraštruktúra - 1.fáza\" - projekt rozvoja ID projekt_1731. Jedná sa informačno-komunikačnú infraštruktúru pre druhú lokalitu v režime ACTIVE-ACTIVE prevádzkovanú v dátovom centre Kopčianska.\n\nSplnenie projektových požiadaviek na infraštruktúru pred nasadením do produkcie informačného systému - Centrálny ekonomický systém (CES). Jedná sa o hardvérové a softvérové komponenty pre realizáciu a nasadenie infraštruktúry pre prvú fázu systému CES. Organizácie zapojené do IS CES získajú centrálne spravovaný, aktuálny a metodicky správne implementovaný ekonomický informačný systém pokrývajúci najdôležitejšie ekonomické procesy. Zároveň budú odbremenené od správy vlastného ekonomického informačného systému a ich oddelenia pre informačné technológie sa budú môcť zamerať na správu a prevádzku agendových informačných systémov. Infraštruktúra pre prevádzku prostredí IS CES bude lokalizovaná v jednom výpočtovom centre, konkrétne vo výpočtovom centre Kopčianska ul., DataCentrum. V rámci tohto výpočtového centra bude taktiež zabezpečená vysoká dostupnosť služieb podľa štandardov DataCentra.",
          datum_zacatia: Time.parse("2022-07-01T00:00:00.000+02:00").utc,
          termin_ukoncenia: Time.parse("2022-12-31T00:00:00.000+01:00").utc,
          schvalovaci_proces: "OPTIONAL_APPROVAL",
          zdroj: "c_zdroj.1",
          financna_skupina: "c_financna_skupina.2",
          suma_vydavkov: BigDecimal(993648),
          rocne_naklady: BigDecimal(0),
          ref_id: "https://data.gov.sk/id/egov/project/1800",
          stav: "c_stav_projektu_8",
          zmena_stavu: Time.parse("2022-05-30T00:00:00.000+02:00").utc,
          schvalene_rocne_naklady: BigDecimal(1000),
          schvaleny_rozpocet: BigDecimal(400000),
          datum_nfp: Time.parse("2019-10-12T00:00:00.000+02:00").utc,
          link_nfp: "https://www.crz.gov.sk/4255936/",
          vyhlasenie_vo: Time.parse("2021-06-17T00:00:00.000+02:00").utc,
          vo: "https://www.uvo.gov.sk/vestnik/oznamenie/detail/505402?page=1&limit=20&sort=datumZverejnenia&sort-dir=DESC&ext=0&cisloOznamenia=&text=%C3%9Arad+pre+regul%C3%A1ciu+elektronick%C3%BDch&year=0&dzOd=&dzDo=&cvestnik=&doznamenia=-1&dzakazky=-1&dpostupu=-1&mdodania=&kcpv=&opb=&szfeu=&flimit=-1&nobstaravatel=&ndodavatel=&nzakazky=",
          zmluva_o_dielo: Time.parse("2021-08-27T00:00:00.000+02:00").utc,
          zmluva_o_dielo_crz: "https://www.crz.gov.sk/zmluva/5784936/",
          raw_data: '{"type":"Projekt","uuid":"372a7fe0-b8a8-42c8-b4c2-b2c77151ff49","attributes":[{"name":"EA_Profil_Projekt_schvalovaci_proces","value":"OPTIONAL_APPROVAL"},{"name":"EA_Profil_Projekt_zmena_stavu","value":"2022-05-30T00:00:00.000+02:00"},{"name":"Gen_Profil_kod_metais","value":"projekt_1800"},{"name":"EA_Profil_Projekt_termin_ukoncenia","value":"2022-12-31T00:00:00.000+01:00"},{"name":"EA_Profil_Projekt_typ_investicie","value":"c_projekt"},{"name":"EA_Profil_Projekt_datum_zacatia","value":"2022-07-01T00:00:00.000+02:00"},{"name":"Gen_Profil_nazov","value":"Centrálny ekonomický systém - HW a SW infraštruktúra - 2.fáza"},{"name":"Gen_Profil_popis","value":"Projekt nadväzuje na projekt \"Centrálny ekonomický systém - HW a SW infraštruktúra - 1.fáza\" - projekt rozvoja ID projekt_1731. Jedná sa informačno-komunikačnú infraštruktúru pre druhú lokalitu v režime ACTIVE-ACTIVE prevádzkovanú v dátovom centre Kopčianska.\n\nSplnenie projektových požiadaviek na infraštruktúru pred nasadením do produkcie informačného systému - Centrálny ekonomický systém (CES). Jedná sa o hardvérové a softvérové komponenty pre realizáciu a nasadenie infraštruktúry pre prvú fázu systému CES. Organizácie zapojené do IS CES získajú centrálne spravovaný, aktuálny a metodicky správne implementovaný ekonomický informačný systém pokrývajúci najdôležitejšie ekonomické procesy. Zároveň budú odbremenené od správy vlastného ekonomického informačného systému a ich oddelenia pre informačné technológie sa budú môcť zamerať na správu a prevádzku agendových informačných systémov. Infraštruktúra pre prevádzku prostredí IS CES bude lokalizovaná v jednom výpočtovom centre, konkrétne vo výpočtovom centre Kopčianska ul., DataCentrum. V rámci tohto výpočtového centra bude taktiež zabezpečená vysoká dostupnosť služieb podľa štandardov DataCentra."},{"name":"Gen_Profil_zdroj","value":"c_zdroj.1"},{"name":"Financny_Profil_Projekt_financna_skupina","value":"c_financna_skupina.2"},{"name":"EA_Profil_Projekt_prijimatel","value":"DataCentrum"},{"name":"EA_Profil_Projekt_faza_projektu","value":"c_faza_projektu.3"},{"name":"Financny_Profil_Projekt_suma_vydavkov","value":993648.0},{"name":"Financny_Profil_Projekt_rocne_naklady","value":0.0},{"name":"Gen_Profil_ref_id","value":"https://data.gov.sk/id/egov/project/1800"},{"name":"EA_Profil_Projekt_program","value":"cbb58995-4588-4fec-ab49-f491ba95f223"},{"name":"EA_Profil_Projekt_status","value":"c_stav_projektu_8"},{"name":"Financny_Profil_Projekt_schvalene_rocne_naklady","value":1000.0},{"name":"Financny_Profil_Projekt_schvaleny_rozpocet","value":400000.0},{"name":"status_projetku_status_projektu_Datum_NFP","value":"2019-10-12T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_zmluva_o_dielo_CRZ","value":"https://www.crz.gov.sk/zmluva/5784936/"},{"name":"status_projetku_status_projektu_vyhlasenie_VO","value":"2021-06-17T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_zmluva_o_dielo","value":"2021-08-27T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_link_NFP","value":"https://www.crz.gov.sk/4255936/"},{"name":"status_projetku_status_projektu_VO","value":"https://www.uvo.gov.sk/vestnik/oznamenie/detail/505402?page=1\u0026limit=20\u0026sort=datumZverejnenia\u0026sort-dir=DESC\u0026ext=0\u0026cisloOznamenia=\u0026text=%C3%9Arad+pre+regul%C3%A1ciu+elektronick%C3%BDch\u0026year=0\u0026dzOd=\u0026dzDo=\u0026cvestnik=\u0026doznamenia=-1\u0026dzakazky=-1\u0026dpostupu=-1\u0026mdodania=\u0026kcpv=\u0026opb=\u0026szfeu=\u0026flimit=-1\u0026nobstaravatel=\u0026ndodavatel=\u0026nzakazky="}],"metaAttributes":{"owner":"1d8a37f7-3063-46d2-b66a-c1b0c8471878-e2583d93-19e7-4f9f-95fe-45f6a9529e73","state":"DRAFT","createdBy":"marian.spisiak2","createdAt":"2022-05-16T11:41:41.985Z","lastModifiedBy":"marian.spisiak2","lastModifiedAt":"2022-05-30T09:08:30.513Z"}}',
        )

        expect(Metais::SyncProjectsIsvsJob).to have_been_enqueued.exactly(1).times
        expect(Metais::SyncRelatedDocumentsJob).to have_been_enqueued.exactly(1).times
      end
    end

    context "with different values" do
      let!(:project) { create(:metais_project) }
      let!(:project_version) { create(:metais_project_version, project: project) }

      it 'updates project and queues another jobs' do
        project.update(latest_version: project_version)
        expect(Metais::ProjectVersion.last).to have_attributes(
          project: project,
          nazov: "Centrálny ekonomický systém - HW a SW infraštruktúra - 2.fáza",
        )

        expect(Metais::Project.last).to have_attributes(
          latest_version: project_version,
        ) 

        expect {
          subject.perform(JSON.parse('{"type":"Projekt","uuid":"372a7fe0-b8a8-42c8-b4c2-b2c77151ff49","attributes":[{"name":"EA_Profil_Projekt_schvalovaci_proces","value":"OPTIONAL_APPROVAL"},{"name":"EA_Profil_Projekt_zmena_stavu","value":"2022-05-30T00:00:00.000+02:00"},{"name":"Gen_Profil_kod_metais","value":"projekt_1800"},{"name":"EA_Profil_Projekt_termin_ukoncenia","value":"2022-12-31T00:00:00.000+01:00"},{"name":"EA_Profil_Projekt_typ_investicie","value":"c_projekt"},{"name":"EA_Profil_Projekt_datum_zacatia","value":"2022-07-01T00:00:00.000+02:00"},{"name":"Gen_Profil_nazov","value":"updated Centrálny ekonomický systém - HW a SW infraštruktúra - 2.fáza"},{"name":"Gen_Profil_popis","value":"Projekt nadväzuje na projekt \"Centrálny ekonomický systém - HW a SW infraštruktúra - 1.fáza\" - projekt rozvoja ID projekt_1731. Jedná sa informačno-komunikačnú infraštruktúru pre druhú lokalitu v režime ACTIVE-ACTIVE prevádzkovanú v dátovom centre Kopčianska.\n\nSplnenie projektových požiadaviek na infraštruktúru pred nasadením do produkcie informačného systému - Centrálny ekonomický systém (CES). Jedná sa o hardvérové a softvérové komponenty pre realizáciu a nasadenie infraštruktúry pre prvú fázu systému CES. Organizácie zapojené do IS CES získajú centrálne spravovaný, aktuálny a metodicky správne implementovaný ekonomický informačný systém pokrývajúci najdôležitejšie ekonomické procesy. Zároveň budú odbremenené od správy vlastného ekonomického informačného systému a ich oddelenia pre informačné technológie sa budú môcť zamerať na správu a prevádzku agendových informačných systémov. Infraštruktúra pre prevádzku prostredí IS CES bude lokalizovaná v jednom výpočtovom centre, konkrétne vo výpočtovom centre Kopčianska ul., DataCentrum. V rámci tohto výpočtového centra bude taktiež zabezpečená vysoká dostupnosť služieb podľa štandardov DataCentra."},{"name":"Gen_Profil_zdroj","value":"c_zdroj.1"},{"name":"Financny_Profil_Projekt_financna_skupina","value":"c_financna_skupina.2"},{"name":"EA_Profil_Projekt_prijimatel","value":"DataCentrum"},{"name":"EA_Profil_Projekt_faza_projektu","value":"c_faza_projektu.3"},{"name":"Financny_Profil_Projekt_suma_vydavkov","value":993648.0},{"name":"Financny_Profil_Projekt_rocne_naklady","value":0.0},{"name":"Gen_Profil_ref_id","value":"https://data.gov.sk/id/egov/project/1800"},{"name":"EA_Profil_Projekt_program","value":"cbb58995-4588-4fec-ab49-f491ba95f223"},{"name":"EA_Profil_Projekt_status","value":"c_stav_projektu_8"},{"name":"Financny_Profil_Projekt_schvalene_rocne_naklady","value":1000.0},{"name":"Financny_Profil_Projekt_schvaleny_rozpocet","value":400000.0},{"name":"status_projetku_status_projektu_Datum_NFP","value":"2019-10-12T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_zmluva_o_dielo_CRZ","value":"https://www.crz.gov.sk/zmluva/5784936/"},{"name":"status_projetku_status_projektu_vyhlasenie_VO","value":"2021-06-17T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_zmluva_o_dielo","value":"2021-08-27T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_link_NFP","value":"https://www.crz.gov.sk/4255936/"},{"name":"status_projetku_status_projektu_VO","value":"https://www.uvo.gov.sk/vestnik/oznamenie/detail/505402?page=1\u0026limit=20\u0026sort=datumZverejnenia\u0026sort-dir=DESC\u0026ext=0\u0026cisloOznamenia=\u0026text=%C3%9Arad+pre+regul%C3%A1ciu+elektronick%C3%BDch\u0026year=0\u0026dzOd=\u0026dzDo=\u0026cvestnik=\u0026doznamenia=-1\u0026dzakazky=-1\u0026dpostupu=-1\u0026mdodania=\u0026kcpv=\u0026opb=\u0026szfeu=\u0026flimit=-1\u0026nobstaravatel=\u0026ndodavatel=\u0026nzakazky="}],"metaAttributes":{"owner":"1d8a37f7-3063-46d2-b66a-c1b0c8471878-e2583d93-19e7-4f9f-95fe-45f6a9529e73","state":"DRAFT","createdBy":"marian.spisiak2","createdAt":"2022-05-16T11:41:41.985Z","lastModifiedBy":"marian.spisiak2","lastModifiedAt":"2022-05-30T09:08:30.513Z"}}'))
        }.to change(Metais::Project, :count).by(0)
         .and change(Metais::ProjectVersion, :count).by(1)

        expect(Metais::Project.last).to have_attributes(
          latest_version: Metais::ProjectVersion.last,
          uuid: "372a7fe0-b8a8-42c8-b4c2-b2c77151ff49",
        )

        expect(Metais::ProjectVersion.last).to have_attributes(
          project: Metais::Project.last,
          nazov: "updated Centrálny ekonomický systém - HW a SW infraštruktúra - 2.fáza",
          kod_metais: "projekt_1800",
          typ_investicie: "c_projekt",
          prijimatel: "DataCentrum",
          faza_projektu: "c_faza_projektu.3",
          program: "cbb58995-4588-4fec-ab49-f491ba95f223",
          popis: "Projekt nadväzuje na projekt \"Centrálny ekonomický systém - HW a SW infraštruktúra - 1.fáza\" - projekt rozvoja ID projekt_1731. Jedná sa informačno-komunikačnú infraštruktúru pre druhú lokalitu v režime ACTIVE-ACTIVE prevádzkovanú v dátovom centre Kopčianska.\n\nSplnenie projektových požiadaviek na infraštruktúru pred nasadením do produkcie informačného systému - Centrálny ekonomický systém (CES). Jedná sa o hardvérové a softvérové komponenty pre realizáciu a nasadenie infraštruktúry pre prvú fázu systému CES. Organizácie zapojené do IS CES získajú centrálne spravovaný, aktuálny a metodicky správne implementovaný ekonomický informačný systém pokrývajúci najdôležitejšie ekonomické procesy. Zároveň budú odbremenené od správy vlastného ekonomického informačného systému a ich oddelenia pre informačné technológie sa budú môcť zamerať na správu a prevádzku agendových informačných systémov. Infraštruktúra pre prevádzku prostredí IS CES bude lokalizovaná v jednom výpočtovom centre, konkrétne vo výpočtovom centre Kopčianska ul., DataCentrum. V rámci tohto výpočtového centra bude taktiež zabezpečená vysoká dostupnosť služieb podľa štandardov DataCentra.",
          datum_zacatia: Time.parse("2022-07-01T00:00:00.000+02:00").utc,
          termin_ukoncenia: Time.parse("2022-12-31T00:00:00.000+01:00").utc,
          schvalovaci_proces: "OPTIONAL_APPROVAL",
          zdroj: "c_zdroj.1",
          financna_skupina: "c_financna_skupina.2",
          suma_vydavkov: BigDecimal(993648),
          rocne_naklady: BigDecimal(0),
          ref_id: "https://data.gov.sk/id/egov/project/1800",
          stav: "c_stav_projektu_8",
          zmena_stavu: Time.parse("2022-05-30T00:00:00.000+02:00").utc,
          schvalene_rocne_naklady: BigDecimal(1000),
          schvaleny_rozpocet: BigDecimal(400000),
          datum_nfp: Time.parse("2019-10-12T00:00:00.000+02:00").utc,
          link_nfp: "https://www.crz.gov.sk/4255936/",
          vyhlasenie_vo: Time.parse("2021-06-17T00:00:00.000+02:00").utc,
          vo: "https://www.uvo.gov.sk/vestnik/oznamenie/detail/505402?page=1&limit=20&sort=datumZverejnenia&sort-dir=DESC&ext=0&cisloOznamenia=&text=%C3%9Arad+pre+regul%C3%A1ciu+elektronick%C3%BDch&year=0&dzOd=&dzDo=&cvestnik=&doznamenia=-1&dzakazky=-1&dpostupu=-1&mdodania=&kcpv=&opb=&szfeu=&flimit=-1&nobstaravatel=&ndodavatel=&nzakazky=",
          zmluva_o_dielo: Time.parse("2021-08-27T00:00:00.000+02:00").utc,
          zmluva_o_dielo_crz: "https://www.crz.gov.sk/zmluva/5784936/",
          raw_data: '{"type":"Projekt","uuid":"372a7fe0-b8a8-42c8-b4c2-b2c77151ff49","attributes":[{"name":"EA_Profil_Projekt_schvalovaci_proces","value":"OPTIONAL_APPROVAL"},{"name":"EA_Profil_Projekt_zmena_stavu","value":"2022-05-30T00:00:00.000+02:00"},{"name":"Gen_Profil_kod_metais","value":"projekt_1800"},{"name":"EA_Profil_Projekt_termin_ukoncenia","value":"2022-12-31T00:00:00.000+01:00"},{"name":"EA_Profil_Projekt_typ_investicie","value":"c_projekt"},{"name":"EA_Profil_Projekt_datum_zacatia","value":"2022-07-01T00:00:00.000+02:00"},{"name":"Gen_Profil_nazov","value":"updated Centrálny ekonomický systém - HW a SW infraštruktúra - 2.fáza"},{"name":"Gen_Profil_popis","value":"Projekt nadväzuje na projekt \"Centrálny ekonomický systém - HW a SW infraštruktúra - 1.fáza\" - projekt rozvoja ID projekt_1731. Jedná sa informačno-komunikačnú infraštruktúru pre druhú lokalitu v režime ACTIVE-ACTIVE prevádzkovanú v dátovom centre Kopčianska.\n\nSplnenie projektových požiadaviek na infraštruktúru pred nasadením do produkcie informačného systému - Centrálny ekonomický systém (CES). Jedná sa o hardvérové a softvérové komponenty pre realizáciu a nasadenie infraštruktúry pre prvú fázu systému CES. Organizácie zapojené do IS CES získajú centrálne spravovaný, aktuálny a metodicky správne implementovaný ekonomický informačný systém pokrývajúci najdôležitejšie ekonomické procesy. Zároveň budú odbremenené od správy vlastného ekonomického informačného systému a ich oddelenia pre informačné technológie sa budú môcť zamerať na správu a prevádzku agendových informačných systémov. Infraštruktúra pre prevádzku prostredí IS CES bude lokalizovaná v jednom výpočtovom centre, konkrétne vo výpočtovom centre Kopčianska ul., DataCentrum. V rámci tohto výpočtového centra bude taktiež zabezpečená vysoká dostupnosť služieb podľa štandardov DataCentra."},{"name":"Gen_Profil_zdroj","value":"c_zdroj.1"},{"name":"Financny_Profil_Projekt_financna_skupina","value":"c_financna_skupina.2"},{"name":"EA_Profil_Projekt_prijimatel","value":"DataCentrum"},{"name":"EA_Profil_Projekt_faza_projektu","value":"c_faza_projektu.3"},{"name":"Financny_Profil_Projekt_suma_vydavkov","value":993648.0},{"name":"Financny_Profil_Projekt_rocne_naklady","value":0.0},{"name":"Gen_Profil_ref_id","value":"https://data.gov.sk/id/egov/project/1800"},{"name":"EA_Profil_Projekt_program","value":"cbb58995-4588-4fec-ab49-f491ba95f223"},{"name":"EA_Profil_Projekt_status","value":"c_stav_projektu_8"},{"name":"Financny_Profil_Projekt_schvalene_rocne_naklady","value":1000.0},{"name":"Financny_Profil_Projekt_schvaleny_rozpocet","value":400000.0},{"name":"status_projetku_status_projektu_Datum_NFP","value":"2019-10-12T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_zmluva_o_dielo_CRZ","value":"https://www.crz.gov.sk/zmluva/5784936/"},{"name":"status_projetku_status_projektu_vyhlasenie_VO","value":"2021-06-17T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_zmluva_o_dielo","value":"2021-08-27T00:00:00.000+02:00"},{"name":"status_projetku_status_projektu_link_NFP","value":"https://www.crz.gov.sk/4255936/"},{"name":"status_projetku_status_projektu_VO","value":"https://www.uvo.gov.sk/vestnik/oznamenie/detail/505402?page=1\u0026limit=20\u0026sort=datumZverejnenia\u0026sort-dir=DESC\u0026ext=0\u0026cisloOznamenia=\u0026text=%C3%9Arad+pre+regul%C3%A1ciu+elektronick%C3%BDch\u0026year=0\u0026dzOd=\u0026dzDo=\u0026cvestnik=\u0026doznamenia=-1\u0026dzakazky=-1\u0026dpostupu=-1\u0026mdodania=\u0026kcpv=\u0026opb=\u0026szfeu=\u0026flimit=-1\u0026nobstaravatel=\u0026ndodavatel=\u0026nzakazky="}],"metaAttributes":{"owner":"1d8a37f7-3063-46d2-b66a-c1b0c8471878-e2583d93-19e7-4f9f-95fe-45f6a9529e73","state":"DRAFT","createdBy":"marian.spisiak2","createdAt":"2022-05-16T11:41:41.985Z","lastModifiedBy":"marian.spisiak2","lastModifiedAt":"2022-05-30T09:08:30.513Z"}}',
        )

        expect(Metais::SyncProjectsIsvsJob).to have_been_enqueued.exactly(1).times
        expect(Metais::SyncRelatedDocumentsJob).to have_been_enqueued.exactly(1).times
      end
    end
  end
end
