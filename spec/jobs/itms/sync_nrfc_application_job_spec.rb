require 'rails_helper'

RSpec.describe Itms::SyncNrfcApplicationJob, type: :job do
  include_context 'itms_downloader'

  context '#perform' do
    it 'temporarily creates an object with itms id' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/zonfp/prijate/1')
          .and_return(double(body: itms_file_fixture('zonfp_prijata_item.json')))
          .once

      subject.perform('/v2/zonfp/prijate/1', downloader: downloader)

      expect(Itms::NrfcApplication.first).to have_attributes(
        itms_id: 1,
        itms_href: "/v2/zonfp/prijate/1",
        itms_created_at: DateTime.parse('2015-09-25T08:08:04.391Z'),
        itms_updated_at: DateTime.parse('2017-02-28T16:51:30.730102Z'),

        akronym: "ZEN BSŠ SNV",
        aktivity_projekt: [
            Itms::NrfcApplicationActivity.find_by!(
                datum_konca_planovany: DateTime.parse("2018-01-01"),
                datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
                kod: "219A01100001",
                nazov: "Vodovodná sieť",
                subjekt: Itms::Subject.find_by!(itms_id: 100052),
                typ_aktivity: Itms::ActivityType.find_by!(itms_id: 219),
            ),
            Itms::NrfcApplicationActivity.find_by!(
                datum_konca_planovany: DateTime.parse("2018-01-01"),
                datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
                kod: "217A01100002",
                nazov: "Stoková sieť",
                subjekt: Itms::Subject.find_by!(itms_id: 100052),
                typ_aktivity: Itms::ActivityType.find_by!(itms_id: 217),
            ),
            Itms::NrfcApplicationActivity.find_by!(
                datum_konca_planovany: DateTime.parse("2018-03-01"),
                datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
                kod: "310A011P0001",
                nazov: "Podporné aktivity",
                subjekt: Itms::Subject.find_by!(itms_id: 100052),
                typ_aktivity: Itms::ActivityType.find_by!(itms_id: 790),
            ),
        ],
        datum_predlozenia: DateTime.parse("2015-09-29T00:00:00Z"),
        datum_ziadany_konca_hlavnych_aktivit: DateTime.parse("2018-01-01T00:00:00Z"),
        datum_ziadany_konca_realizacie: DateTime.parse("2018-03-01T00:00:00Z"),
        datum_ziadany_zaciatku_hlavnych_aktivit: DateTime.parse("2016-04-01T00:00:00Z"),
        datum_ziadany_zaciatku_realizacie: DateTime.parse("2016-04-01T00:00:00Z"),
        formy_financovania: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1037, 1).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1037, 1).first!,
        ],
        hospodarske_cinnosti: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1038, 22).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1038, 22).first!,
        ],
        kod: "NFP310010A011",
        meratelne_ukazovatele: [
            Itms::NrfcApplicationMeasurableIndicator.find_by!(
                hodnota_cielova_celkova: 756,
                priznak_rizika: true,
                projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 218)
            ),
            Itms::NrfcApplicationMeasurableIndicator.find_by!(
                hodnota_cielova_celkova: 140,
                priznak_rizika: true,
                projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 223)
            ),
            Itms::NrfcApplicationMeasurableIndicator.find_by!(
                hodnota_cielova_celkova: 0,
                priznak_rizika: false,
                projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 216)
            ),
            Itms::NrfcApplicationMeasurableIndicator.find_by!(
                hodnota_cielova_celkova: 6.6035.to_d,
                priznak_rizika: false,
                projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 213)
            ),
            Itms::NrfcApplicationMeasurableIndicator.find_by!(
                hodnota_cielova_celkova: 2.099.to_d,
                priznak_rizika: false,
                projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 221)
            ),
        ],
        miesta_realizacie: [
            Itms::ImplementationPlace.find_by!(
                nuts_3: Itms::NutsCode.find_by!(
                    gps_lat: 49.21911.to_d,
                    gps_lon: 18.740873.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 13).first!
                ),
                nuts_4: Itms::NutsCode.find_by!(
                    gps_lat: 49.061494.to_d,
                    gps_lon: 18.919229.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 56).first!
                ),
                nuts_5: Itms::NutsCode.find_by!(
                    gps_lat: 49.028963.to_d,
                    gps_lon: 18.889524.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 1301).first!
                ),
                stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
            ),
            Itms::ImplementationPlace.find_by!(
                nuts_3: Itms::NutsCode.find_by!(
                    gps_lat: 49.21911.to_d,
                    gps_lon: 18.740873.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 13).first!
                ),
                nuts_4: Itms::NutsCode.find_by!(
                    gps_lat: 49.061494.to_d,
                    gps_lon: 18.919229.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 56).first!
                ),
                nuts_5: Itms::NutsCode.find_by!(
                    gps_lat: 49.028011.to_d,
                    gps_lon: 18.905011.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 1278).first!
                ),
                stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
            ),
        ],
        miesta_realizacie_mimo_uzemia_op: [
            Itms::ImplementationPlace.find_by!(
                nuts_3: Itms::NutsCode.find_by!(
                    gps_lat: 49.21911.to_d,
                    gps_lon: 18.740873.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 13).first!
                ),
                nuts_4: Itms::NutsCode.find_by!(
                    gps_lat: 49.061494.to_d,
                    gps_lon: 18.919229.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 56).first!
                ),
                nuts_5: Itms::NutsCode.find_by!(
                    gps_lat: 49.028963.to_d,
                    gps_lon: 18.889524.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 1301).first!
                ),
                stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
            ),
            Itms::ImplementationPlace.find_by!(
                nuts_3: Itms::NutsCode.find_by!(
                    gps_lat: 49.21911.to_d,
                    gps_lon: 18.740873.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 13).first!
                ),
                nuts_4: Itms::NutsCode.find_by!(
                    gps_lat: 49.061494.to_d,
                    gps_lon: 18.919229.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 56).first!
                ),
                nuts_5: Itms::NutsCode.find_by!(
                    gps_lat: 49.028011.to_d,
                    gps_lon: 18.905011.to_d,
                    hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 1278).first!
                ),
                stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!
            ),
        ],
        nazov: "Turčiansky Peter, Košťany nad Turcom - odkanalizovanie",
        oblasti_intervencie: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1036, 22).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1036, 20).first!,
        ],
        organizacne_zlozky: [
            Itms::OrganisationalUnit.find_by!(
                itms_id: 101,
                adresa: 'Drieňová 22, 82686 Bratislava - mestská časť Ružinov',
                nazov: 'Hasičský a záchranný zbor'
            ),
        ],
        partneri: [
            Itms::Subject.find_by!(itms_id: 100111)
        ],
        percento_ziadane_spolufinancovania: 0.9,
        polozky_rozpoctu: [
            Itms::NrfcApplicationBudgetItem.find_by!(
                itms_id: 876,
                aktivita_zonfp_kod: "219A01100001",
                skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 27).first!,
                suma_opravneneho_vydavku: 11097.88.to_d
            ),
            Itms::NrfcApplicationBudgetItem.find_by!(
                itms_id: 877,
                aktivita_zonfp_kod: "219A01100001",
                skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 4).first!,
                suma_opravneneho_vydavku: 465444.9.to_d
            ),
            Itms::NrfcApplicationBudgetItem.find_by!(
                itms_id: 878,
                aktivita_zonfp_kod: "217A01100002",
                skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 4).first!,
                suma_opravneneho_vydavku: 3499023.09.to_d
            ),
            Itms::NrfcApplicationBudgetItem.find_by!(
                itms_id: 879,
                aktivita_zonfp_kod: "217A01100002",
                skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 27).first!,
                suma_opravneneho_vydavku: 83429.26.to_d
            ),
            Itms::NrfcApplicationBudgetItem.find_by!(
                itms_id: 880,
                aktivita_zonfp_kod: "310A011P0001",
                skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 16).first!,
                suma_opravneneho_vydavku: 33435.58.to_d
            ),
            Itms::NrfcApplicationBudgetItem.find_by!(
                itms_id: 881,
                aktivita_zonfp_kod: "310A011P0001",
                skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 15).first!,
                suma_opravneneho_vydavku: 2772.44.to_d
            ),
        ],
        popis_projektu: "\u003cdiv\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003e\u0026Uacute;čelom projektu je dobudovanie kanaliz\u0026aacute;cie a\u0026nbsp;odvedenie OV z\u0026nbsp;doposiaľ neodkanalizovan\u0026yacute;ch čast\u0026iacute; obce ako aj z\u0026nbsp;novo navrhovanej IBV\u0026nbsp;v obci Turčiansky Peter a Ko\u0026scaron;ťany nad Turcom. Tak isto projekt rie\u0026scaron;i aj v\u0026yacute;stavbu vodovodnej siete pre novo navrhovan\u0026uacute; IBV v obci Turčiansky Peter a Ko\u0026scaron;ťany nad Turcom v spoločnej ryhe s kanaliz\u0026aacute;ciou.\u0026nbsp;Dobudovanie odkanalizovania obci\u0026nbsp;je navrhnut\u0026eacute; gravitačnou spla\u0026scaron;kovou kanaliz\u0026aacute;ciou s\u0026nbsp;miestnym prečerp\u0026aacute;van\u0026iacute;m spla\u0026scaron;kov\u0026yacute;ch odpadov\u0026yacute;ch v\u0026ocirc;d cez čerpacie stanice a čisten\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d na ČOV Vr\u0026uacute;tky.\u0026nbsp;Dobudovan\u0026iacute;m kanaliz\u0026aacute;cie a t\u0026yacute;m i odveden\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d z\u0026nbsp;neodkanalizovan\u0026yacute;ch čast\u0026iacute; spom\u0026iacute;nan\u0026yacute;ch obc\u0026iacute;\u0026nbsp;sa jednoznačne zlep\u0026scaron;\u0026iacute; životn\u0026eacute; prostredie v\u0026nbsp;regi\u0026oacute;ne. Zlikviduj\u0026uacute; sa žumpy, ktor\u0026eacute; m\u0026ocirc;žu byť netesn\u0026eacute; a zamedz\u0026iacute; sa nekontrolovateľn\u0026eacute;mu vyp\u0026uacute;\u0026scaron;ťaniu spla\u0026scaron;kov\u0026yacute;ch v\u0026ocirc;d. V r\u0026aacute;mci projektu sa vybuduje 6,6035 km spla\u0026scaron;kovej kanaliz\u0026aacute;cie, vyhotov\u0026iacute; sa 270 kanalizačn\u0026yacute;ch za\u0026uacute;sten\u0026iacute; ďalej sa vybuduje 2,516 km vodovodn\u0026eacute;ho potrubia s toho je 2,099 km veden\u0026eacute; spoločnej v jednej ryhe so spla\u0026scaron;kovou kanaliz\u0026aacute;ciou. V r\u0026aacute;mci projektu sa zv\u0026yacute;\u0026scaron;i počet obyvateľov so zlep\u0026scaron;en\u0026yacute;m čisten\u0026iacute;m OV o 756 obyvateľov a zasobovan\u0026iacute;m pitnou vodou o 140 obyvateľov. V\u0026nbsp;s\u0026uacute;časnosti je pripojen\u0026yacute;ch na spla\u0026scaron;kov\u0026uacute; kanaliz\u0026aacute;ciu s\u0026nbsp;čisten\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d na\u0026nbsp;ČOV Vr\u0026uacute;tky 2 326 obyvateľov. Po vybudovan\u0026iacute; projektu bude napojen\u0026yacute;ch na spla\u0026scaron;kov\u0026uacute; kanaliz\u0026aacute;ciu s\u0026nbsp;čisten\u0026iacute;m OV na ČOV Vr\u0026uacute;tky v\u0026nbsp;predmetnej aglomer\u0026aacute;cii 3 082 obyvateľov.\u003c/div\u003e\u003c/div\u003e",
        sekundarny_tematicky_okruh: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(16, 1044, 8).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(15, 1044, 8).first!,
        ],
        suma_ziadana_celkova: 4095203.15,
        suma_ziadana_celkova_projektov_generujucich_prijem: 4095203.15,
        suma_ziadana_nfp: 3685682.83,
        suma_ziadana_vlastnych_zdrojov: 409520.32,
        typy_uzemia: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1034, 3).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1034, 3).first!,
        ],
        vyzva: Itms::AnnouncedProposalCall.find_by!(itms_id: 1),
        zameranie_projektu: "Dopytovo-orientovaný projekt",
        ziadatel: Itms::Subject.find_by!(itms_id: 100052),
      )
    end
    
    pending 'syncs accepted'
    pending 'syncs rejected'
  end
end
