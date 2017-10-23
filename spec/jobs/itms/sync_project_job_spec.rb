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
            Itms::SpecificGoalCode.find_by!(
                kod_id: 1,
                kod_zdroj: '01',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 33),
                nazov: 'Nenávratný grant'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 1,
                kod_zdroj: '01',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 39),
                nazov: 'Nenávratný grant'
            ),
        ],
        hospodarske_cinnosti: [
            Itms::SpecificGoalCode.find_by!(
                kod_id: 22,
                kod_zdroj: '22',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 39),
                nazov: 'Činnosti súvisiace so životným prostredím a zmenou klímy'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 22,
                kod_zdroj: '22',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 33),
                nazov: 'Činnosti súvisiace so životným prostredím a zmenou klímy'
            ),
        ],
        #TODO intenzity: ,
            # "$ref": "#/definitions/IntenzitaLinkCollection"
        # },
        kod: '310011A019',
        #TODO meratelne_ukazovatele: ,
            # "type": "array",
            # items: ,
                # "$ref": "#/definitions/MeratelnyUkazovatel"
            # # },
            # "description": "Merateľné ukazovatele",
            # "example": [
                # {
                    # "aktualnySkutocnyStav": 0.9560800557173746,
                    # "datumPoslednehoMerania": "Quia ullam quo quae temporibus ut.",
                    # "hodnotaCielovaCelkova": 0.2410834283342169,
                    # "kod": "Non minima.",
                    # "mernaJednotka": "Odio reiciendis molestiae quo.",
                    # "nazov": "Repellat ut ipsum autem."
                # # },
                # {
                    # "aktualnySkutocnyStav": 0.9560800557173746,
                    # "datumPoslednehoMerania": "Quia ullam quo quae temporibus ut.",
                    # "hodnotaCielovaCelkova": 0.2410834283342169,
                    # "kod": "Non minima.",
                    # "mernaJednotka": "Odio reiciendis molestiae quo.",
                    # "nazov": "Repellat ut ipsum autem."
                # # },
                # {
                    # "aktualnySkutocnyStav": 0.9560800557173746,
                    # "datumPoslednehoMerania": "Quia ullam quo quae temporibus ut.",
                    # "hodnotaCielovaCelkova": 0.2410834283342169,
                    # "kod": "Non minima.",
                    # "mernaJednotka": "Odio reiciendis molestiae quo.",
                    # "nazov": "Repellat ut ipsum autem."
                # }
            # ]
        # },
        # TODO miesta_realizacie: ,
            # "type": "array",
            # items: ,
                # "$ref": "#/definitions/MiestoRealizacie"
            # # },
            # "description": "Miesta realizácie",
            # "example": [
                # {
                    # nuts3: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # # },
                    # nuts4: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # # },
                    # nuts5: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # # },
                    # stat: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # }
                # # },
                # {
                    # nuts3: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # # },
                    # nuts4: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # # },
                    # nuts5: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # # },
                    # stat: ,
                        # "id": 346272781115811725,
                        # "kodZdroj": "Quasi in adipisci molestiae rerum aut quo.",
                        # "nazov": "Iste omnis fuga et accusantium impedit eveniet."
                    # }
                # }
            # ]
        # },
        #TODO monitorovacie_terminy: ,
            # "type": "array",
            # items: ,
                # "$ref": "#/definitions/MonitorovaciTermin"
            # # },
            # "description": "Monitorovacie termíny",
            # "example": [
                # {
                    # "datumPredlozeniaNajneskorsi": "Veritatis quidem perspiciatis temporibus.",
                    # "poradoveCislo": 7227638007954916079,
                    # "terminMonitorovania": "Esse itaque saepe.",
                    # "typMonitorovacejSpravy": "Quod sunt commodi vel quisquam aliquid."
                # # },
                # {
                    # "datumPredlozeniaNajneskorsi": "Veritatis quidem perspiciatis temporibus.",
                    # "poradoveCislo": 7227638007954916079,
                    # "terminMonitorovania": "Esse itaque saepe.",
                    # "typMonitorovacejSpravy": "Quod sunt commodi vel quisquam aliquid."
                # }
            # ]
        # },
        nazov: 'Dobudovanie kanalizačnej siete v aglomerácii Veľké Leváre a rozšírenie ČOV Gajary',
        oblasti_intervencie: [
            Itms::SpecificGoalCode.find_by!(
                kod_id: 22,
                kod_zdroj: '022',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 33),
                nazov: 'Čistenie odpadových vôd'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 20,
                kod_zdroj: '020',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 39),
                nazov: 'Dodávky vody na ľudskú spotrebu (získavanie, čistenie, infraštruktúra na uskladňovanie a distribúciu)'
            ),
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
            Itms::SpecificGoalCode.find_by!(
                kod_id: 6,
                kod_zdroj: '06',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 24),
                nazov: 'NediskriminĂˇcia'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 7,
                kod_zdroj: '07',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 24),
                nazov: 'RodovĂˇ rovnosĹĄ'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 2,
                kod_zdroj: '02',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 24),
                nazov: 'SociĂˇlna inovĂˇcia'
            ),
        ],
        stav: 'Projekt mimoriadne ukončený - neprispel k cieľom OP (K)',
        suma_celkova_projektov_generujucich_prijem: 16165937.74,
        suma_zazmluvnena: 16165937.74,
        suma_zazmluvnena_povodna: 16165937.74,
        typy_uzemia: [
            Itms::SpecificGoalCode.find_by!(
                kod_id: 3,
                kod_zdroj: '03',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 33),
                nazov: 'Vidiecke oblasti (riedke osídlenie)'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 3,
                kod_zdroj: '03',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 39),
                nazov: 'Vidiecke oblasti (riedke osídlenie)'
            ),
        ],
        url_adresa_zmluva: 'http://www.crz.gov.sk/index.php?ID=3144219&l=sk',
        uzemne_mechanizmy: [
            Itms::SpecificGoalCode.find_by!(
                kod_id: 7,
                kod_zdroj: '07',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 63),
                nazov: 'NeuplatĹuje sa'
            ),
            Itms::SpecificGoalCode.find_by!(
                kod_id: 7,
                kod_zdroj: '07',
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 64),
                nazov: 'NeuplatĹuje sa'
            ),
        ],
        #TODO vyzva: ,
            # "$ref": "#/definitions/VyhlasenavyzvaLink"
        # },
        zameranie_projektu: 'Dopytovo-orientovaný projekt',
      )
    end

    pending 'attributes to be implemented' do
      expect(Itms::Project.first).to respond_to(
        :data_projektu,
        :intenzity,
        :meratelne_ukazovatele,
        :miesta_realizacie,
        :monitorovacie_terminy,
        :organizacne_zlozky,
        :partneri,
        :polozky_rozpoctu,
        :schvalena_zonfp,
        :vyzva,
      )
    end
  end
end
