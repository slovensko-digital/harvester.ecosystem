require 'rails_helper'

RSpec.describe Itms::SyncProjectJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs project and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/projekty/ukoncene/31'))
          .and_return(double(body: itms_file_fixture('projekt_item.json')))
          .at_least(:once)

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/subjekty/'))
          .and_return(double(body: itms_file_fixture('subjekt_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/aktivita/'))
          .and_return(double(body: itms_file_fixture('aktivita_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/typyAktivit/'))
          .and_return(double(body: itms_file_fixture('typ_aktivity_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/konkretnyCiel/'))
          .and_return(double(body: itms_file_fixture('konkretny_ciel_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/intenzita/'))
          .and_return(double(body: itms_file_fixture('intenzita_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/hodnotaCiselnika/'))
          .and_return(double(body: itms_file_fixture('hodnota_ciselnika_item.json')))

      allow(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/ciselniky')
          .and_return(double(body: itms_file_fixture('ciselniky_list.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/projektovyUkazovatel/'))
          .and_return(double(body: itms_file_fixture('projektovy_ukazovatel_item.json')))

      subject.perform('/v2/projekty/ukoncene/31', downloader: downloader)

      expect(Itms::Project.first).to have_attributes(
        itms_id: 31,
        itms_href: '/v2/projekty/ukoncene/31',
        itms_created_at: DateTime.parse('2016-02-19T09:15:40.868Z'),
        itms_updated_at: DateTime.parse('2017-06-30T09:32:14.961Z'),

        akronym: 'MET OPII',
        aktivity: [
            Itms::ProjectActivity.find_by!(itms_id: 122),
            Itms::ProjectActivity.find_by!(itms_id: 123),
            Itms::ProjectActivity.find_by!(itms_id: 121),
            Itms::ProjectActivity.find_by!(itms_id: 120),
        ],
        cislo_zmluvy: 'OPKZPPO1SC121/1222015/04',
        #TODO data_projektu: ,
        datum_konca_hlavnych_aktivit: DateTime.parse('2018-06-01T00:00:00Z'),
        datum_konca_realizacie: DateTime.parse('2018-06-01T00:00:00Z'),
        datum_platnosti_zmluvy: DateTime.parse('2016-03-11T00:00:00Z'),
        datum_ucinnosti_zmluvy: DateTime.parse('2016-03-23T00:00:00Z'),
        datum_zaciatku_hlavnych_aktivit: DateTime.parse('2017-01-01T00:00:00Z'),
        datum_zaciatku_realizacie: DateTime.parse('2017-01-01T00:00:00Z'),
        dlzka_celkova_hlavnych_aktivit: 18,
        dlzka_celkova_projektu: 18,
        formy_financovania: [
            Itms::ProjectFinancingForm.where_goal_and_codelist(33, 1037, 1).first!,
            Itms::ProjectFinancingForm.where_goal_and_codelist(39, 1037, 1).first!,
        ],
        hospodarske_cinnosti: [
            Itms::ProjectEconomicActivity.where_goal_and_codelist(33, 1038, 22).first!,
            Itms::ProjectEconomicActivity.where_goal_and_codelist(39, 1038, 22).first!,
        ],
        intenzity: [
            Itms::Intensity.find_by!(itms_id: 46)
        ],
        kod: '310011A019',
        meratelne_ukazovatele: [
          Itms::MeasurableIndicator.find_by!(
            aktualny_skutocny_stav: 0.to_d,
            datum_posledneho_merania: Date.parse('2016-12-31'),
            hodnota_cielova_celkova: 22.74.to_d,
            priznak_rizika: false,
            projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 213)
          ),
          Itms::MeasurableIndicator.find_by!(
            aktualny_skutocny_stav: 0.to_d,
            datum_posledneho_merania: Date.parse('2016-12-31'),
            hodnota_cielova_celkova: 1.to_d,
            priznak_rizika: false,
            projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 216)
          ),
          Itms::MeasurableIndicator.find_by!(
            aktualny_skutocny_stav: 0.to_d,
            datum_posledneho_merania: Date.parse('2016-12-31'),
            hodnota_cielova_celkova: 2689.to_d,
            priznak_rizika: true,
            projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 218)
          ),
          Itms::MeasurableIndicator.find_by!(
            aktualny_skutocny_stav: 0.to_d,
            datum_posledneho_merania: Date.parse('2016-12-31'),
            hodnota_cielova_celkova: 3.62.to_d,
            priznak_rizika: false,
            projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 221)
          ),
          Itms::MeasurableIndicator.find_by!(
            aktualny_skutocny_stav: 0.to_d,
            datum_posledneho_merania: Date.parse('2016-12-31'),
            hodnota_cielova_celkova: 589.to_d,
            priznak_rizika: true,
            projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 223)
          ),
        ],
        miesta_realizacie: [
          Itms::ImplementationPlace.find_by!(
            nuts_3: Itms::NutsCode.find_by!(
              gps_lat: 48.147648.to_d,
              gps_lon: 17.109832.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 9).first!
            ),
            nuts_4: Itms::NutsCode.find_by!(
              gps_lat: 48.436091.to_d,
              gps_lon: 17.019968.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 23).first!
            ),
            nuts_5: Itms::NutsCode.find_by!(
              gps_lat: 48.503181.to_d,
              gps_lon: 17.001698.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 123).first!
            ),
            stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
          ),
          Itms::ImplementationPlace.find_by!(
            nuts_3: Itms::NutsCode.find_by!(
              gps_lat: 48.147648.to_d,
              gps_lon: 17.109832.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 9).first!
            ),
            nuts_4: Itms::NutsCode.find_by!(
              gps_lat: 48.436091.to_d,
              gps_lon: 17.019968.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 23).first!
            ),
            nuts_5: Itms::NutsCode.find_by!(
              gps_lat: 48.503122.to_d,
              gps_lon: 16.969778.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 117).first!
            ),
            stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
          ),
        Itms::ImplementationPlace.find_by!(
            nuts_3: Itms::NutsCode.find_by!(
              gps_lat: 48.147648.to_d,
              gps_lon: 17.109832.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 9).first!
            ),
            nuts_4: Itms::NutsCode.find_by!(
              gps_lat: 48.436091.to_d,
              gps_lon: 17.019968.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 23).first!
            ),
            nuts_5: Itms::NutsCode.find_by!(
              gps_lat: 48.466084.to_d,
              gps_lon: 16.923253.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 126).first!
            ),
            stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
          ),
        ],
        miesta_realizacie_mimo_uzemia_op: [
          Itms::ImplementationPlace.find_by!(
            nuts_3: Itms::NutsCode.find_by!(
              gps_lat: 48.147648.to_d,
              gps_lon: 17.109832.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 9).first!
            ),
            nuts_4: Itms::NutsCode.find_by!(
              gps_lat: 48.436091.to_d,
              gps_lon: 17.019968.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 23).first!
            ),
            nuts_5: Itms::NutsCode.find_by!(
              gps_lat: 48.503181.to_d,
              gps_lon: 17.001698.to_d,
              hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 123).first!
            ),
          ),
        ],
        monitorovacie_terminy: [
          Itms::MonitoringDate.find_by!(
            datum_predlozenia_najneskorsi: Date.parse('2018-01-31'),
            poradove_cislo: 2,
            termin_monitorovania: Date.parse('2017-12-31'),
            typ_monitorovacej_spravy: 'VYROCNA',
          ),
          Itms::MonitoringDate.find_by!(
            datum_predlozenia_najneskorsi: Date.parse('2018-08-13'),
            poradove_cislo: 3,
            termin_monitorovania: Date.parse('2018-06-30'),
            typ_monitorovacej_spravy: 'ZAVERECNA',
          ),
          Itms::MonitoringDate.find_by!(
            datum_predlozenia_najneskorsi: Date.parse('2017-01-31'),
            poradove_cislo: 1,
            termin_monitorovania: Date.parse('2016-12-31'),
            typ_monitorovacej_spravy: 'VYROCNA',
          ),
        ],
        nazov: 'Dobudovanie kanalizačnej siete v aglomerácii Veľké Leváre a rozšírenie ČOV Gajary',
        oblasti_intervencie: [
            Itms::ProjectInterventionArea.where_goal_and_codelist(33, 1036, 22).first!,
            Itms::ProjectInterventionArea.where_goal_and_codelist(39, 1036, 20).first!,
        ],
        #TODO organizacne_zlozky: ,
            # "type": "array",
            # items: ,
                # "$ref": "#/definitions/OrganizacnaZlozka"
            # # },
            # "description": "Organizačné zložky prijímateľa",
            # "example": [
                # {
                    # "adresa": "Expedita laboriosam dolorum nihil eius.",
                    # "id": 9221123029454021764,
                    # "nazov": "Voluptas dignissimos voluptas voluptas."
                # # },
                # {
                    # "adresa": "Expedita laboriosam dolorum nihil eius.",
                    # "id": 9221123029454021764,
                    # "nazov": "Voluptas dignissimos voluptas voluptas."
                # # },
                # {
                    # "adresa": "Expedita laboriosam dolorum nihil eius.",
                    # "id": 9221123029454021764,
                    # "nazov": "Voluptas dignissimos voluptas voluptas."
                # }
            # ]
        # },
        otvorena_zmena: false,
        otvoreny_dodatok: false,
        #TODO partneri: ,
            # "$ref": "#/definitions/SubjektLinkCollection"
        # },
        #TODO polozky_rozpoctu: ,
            # "$ref": "#/definitions/PolozkarozpoctuLinkCollection"
        # },
        popis_projektu: "\u003cdiv\u003eCieľom\u0026nbsp;predkladan\u0026eacute;ho projektu je\u0026nbsp;zlep\u0026scaron;enie stavu odv\u0026aacute;dzania a čistenia komun\u0026aacute;lnych v\u0026ocirc;d v aglomer\u0026aacute;cii Veľk\u0026eacute; Lev\u0026aacute;re. D\u0026ocirc;vodom pre realiz\u0026aacute;ciu projektu je nevyhovuj\u0026uacute;ci stav v obciach Mal\u0026eacute; a Veľk\u0026eacute; Lev\u0026aacute;re, kde napojenosť obyvateľstva na kanalizačn\u0026uacute; sieť predstavuje len tretinu tohto obyvateľstva. Odpadov\u0026aacute; voda z uveden\u0026yacute;ch obc\u0026iacute; sa spracuv\u0026aacute;va v čistiarni odpadov\u0026yacute;ch v\u0026ocirc;d (ďalej len ČOV) v obci Gajary, ktor\u0026aacute; je kapacitne plne vyťažen\u0026aacute;. Ostatn\u0026iacute; občania zachyt\u0026aacute;vaj\u0026uacute; spla\u0026scaron;kov\u0026eacute; vody v žump\u0026aacute;ch, čo je rizikov\u0026eacute; najm\u0026auml; z pohľadu vplyvu na životn\u0026eacute; prostredie a z\u0026aacute;roveň aj na zdravie obyvateľstva.\u0026nbsp;\u003c/div\u003e\u003cdiv\u003eProjekt pozost\u0026aacute;va z nasledovn\u0026yacute;ch aktiv\u0026iacute;t:\u0026nbsp;\u003c/div\u003e\u003cdiv\u003ea. dobudovanie\u0026nbsp;kanalizačnej siete v aglomer\u0026aacute;cii Veľk\u0026eacute; Lev\u0026aacute;re\u003c/div\u003e\u003cdiv\u003eb. dobudovanie vodovodnej siete v obci Mal\u0026eacute; Lev\u0026aacute;re\u003c/div\u003e\u003cdiv\u003ec. zv\u0026yacute;\u0026scaron;enie kapacity \u003cspan style=\"background-color:rgb(255, 255, 255); color:rgb(51, 51, 51); line-height:20.8px\"\u003ečistiarne odpadov\u0026yacute;ch v\u0026ocirc;d \u003c/span\u003ev obci Gajary.\u003c/div\u003e\u003cdiv\u003eV\u0026yacute;sledkom projektu bude vybudovan\u0026aacute; kanalizačn\u0026aacute; sieť v celkovej dĺžke 22,74\u0026nbsp;km, vybudovan\u0026aacute; vodovodn\u0026aacute; sieť v dĺžke 3,62\u0026nbsp;km a zv\u0026yacute;\u0026scaron;en\u0026aacute; kapacita čistiarne odpadov\u0026yacute;ch v\u0026ocirc;d na 13 000 EO. Realizovan\u0026iacute;m projektu sa dosiahne zv\u0026yacute;\u0026scaron;en\u0026aacute; napojenosť obyvateľstva na kanalizačn\u0026eacute; siete na viac ako 90 %. Aktivity s\u0026uacute; v\u0026nbsp;s\u0026uacute;lade s\u0026nbsp;OP KŽP a s\u0026nbsp;Pl\u0026aacute;nom rozvoja verejn\u0026yacute;ch kanaliz\u0026aacute;ci\u0026iacute; v\u0026nbsp;SR. Cieľovou skupinou projektu s\u0026uacute; obyvatelia obc\u0026iacute; Veľk\u0026eacute; Lev\u0026aacute;re, Mal\u0026eacute; Lev\u0026aacute;re a Gajary.\u003c/div\u003e",

        prijimatel: Itms::Subject.find_by!(itms_id: 100062),
        #TODO schvalena_zonfp: ,
            # "$ref": "#/definitions/SchvalenazonfpLink"
        # },
        sekundarny_tematicky_okruh: [
            Itms::ProjectSecondaryThematicArea.where_goal_and_codelist(24, 1044, 7).first!,
            Itms::ProjectSecondaryThematicArea.where_goal_and_codelist(24, 1044, 6).first!,
            Itms::ProjectSecondaryThematicArea.where_goal_and_codelist(24, 1044, 2).first!,
        ],
        stav: 'Projekt mimoriadne ukončený - neprispel k cieľom OP (K)',
        suma_celkova_projektov_generujucich_prijem: 16165937.74,
        suma_zazmluvnena: 16165937.74,
        suma_zazmluvnena_povodna: 16165937.74,
        typy_uzemia: [
            Itms::ProjectTerritoryType.where_goal_and_codelist(33, 1034, 3).first!,
            Itms::ProjectTerritoryType.where_goal_and_codelist(39, 1034, 3).first!,
        ],
        url_adresa_zmluva: 'http://www.crz.gov.sk/index.php?ID=3144219&l=sk',
        uzemne_mechanizmy: [
            Itms::ProjectTerritorialMechanism.where_goal_and_codelist(24, 1043, 7).first!,
        ],
        #TODO vyzva: ,
            # "$ref": "#/definitions/VyhlasenavyzvaLink"
        # },
        zameranie_projektu: 'Dopytovo-orientovaný projekt',
      )
    end

    pending 'deletes meratelne_ukazovatele (Itms::MeasurableIndicator) that disappear from the list'

    pending 'attributes to be implemented' do
      expect(Itms::Project.first).to respond_to(
        :data_projektu,
        :miesta_realizacie_mimo_uzemia_op,
        :organizacne_zlozky,
        :partneri,
        :polozky_rozpoctu,
        :popis_situacie_po_realizacii,
        :popis_sposobu_realizacie,
        :popis_vychodiskovej_situacie,
        :popis_kapacity_prijimatela,
        :schvalena_zonfp,
        :vyzva,
      )
    end
  end
end
