require 'rails_helper'

RSpec.describe Itms::SyncNrfcApplicationJob, type: :job do
  include_context 'itms_downloader'

  context '#perform' do
    context 'received nrfc applications' do
      it 'syncs received applications and their attributes' do
        expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zonfp/prijate/1')
          .and_return(itms_json_fixture('zonfp_prijata_item.json'))

        subject.perform('/v2/zonfp/prijate/1', downloader: downloader)

        expect(Itms::NrfcApplicationReceived.first).to have_attributes(
          itms_id: 1,
          itms_href: "/v2/zonfp/prijate/1",
          itms_created_at: DateTime.parse('2015-09-25T08:08:04.391Z'),
          itms_updated_at: DateTime.parse('2017-02-28T16:51:30.730102Z'),

          akronym: "ZEN BSŠ SNV",
          aktivity_projekt: [
            Itms::NrfcApplicationReceivedActivity.find_by!(
              datum_konca_planovany: DateTime.parse("2018-01-01"),
              datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
              kod: "219A01100001",
              nazov: "Vodovodná sieť",
              subjekt: Itms::Subject.find_by!(itms_id: 100052),
              typ_aktivity: Itms::ActivityType.find_by!(itms_id: 219),
            ),
            Itms::NrfcApplicationReceivedActivity.find_by!(
              datum_konca_planovany: DateTime.parse("2018-01-01"),
              datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
              kod: "217A01100002",
              nazov: "Stoková sieť",
              subjekt: Itms::Subject.find_by!(itms_id: 100052),
              typ_aktivity: Itms::ActivityType.find_by!(itms_id: 219),
            ),
            Itms::NrfcApplicationReceivedActivity.find_by!(
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
            Itms::NrfcApplicationReceivedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 756,
              priznak_rizika: true,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 218)
            ),
            Itms::NrfcApplicationReceivedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 140,
              priznak_rizika: true,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 223)
            ),
            Itms::NrfcApplicationReceivedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 0,
              priznak_rizika: false,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 216)
            ),
            Itms::NrfcApplicationReceivedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 6.6035.to_d,
              priznak_rizika: false,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 213)
            ),
            Itms::NrfcApplicationReceivedMeasurableIndicator.find_by!(
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
            Itms::NrfcApplicationReceivedBudgetItem.find_by!(
              itms_id: 876,
              aktivita_zonfp_kod: "219A01100001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 27).first!,
              suma_opravneneho_vydavku: 11097.88.to_d
            ),
            Itms::NrfcApplicationReceivedBudgetItem.find_by!(
              itms_id: 877,
              aktivita_zonfp_kod: "219A01100001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 4).first!,
              suma_opravneneho_vydavku: 465444.9.to_d
            ),
            Itms::NrfcApplicationReceivedBudgetItem.find_by!(
              itms_id: 878,
              aktivita_zonfp_kod: "217A01100002",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 4).first!,
              suma_opravneneho_vydavku: 3499023.09.to_d
            ),
            Itms::NrfcApplicationReceivedBudgetItem.find_by!(
              itms_id: 879,
              aktivita_zonfp_kod: "217A01100002",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 27).first!,
              suma_opravneneho_vydavku: 83429.26.to_d
            ),
            Itms::NrfcApplicationReceivedBudgetItem.find_by!(
              itms_id: 880,
              aktivita_zonfp_kod: "310A011P0001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 16).first!,
              suma_opravneneho_vydavku: 33435.58.to_d
            ),
            Itms::NrfcApplicationReceivedBudgetItem.find_by!(
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
          uzemne_mechanizmy: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(9, 1043, 7).first!,
          ],
          vyzva: Itms::AnnouncedProposalCall.find_by!(itms_id: 1),
          zameranie_projektu: "Dopytovo-orientovaný projekt",
          ziadatel: Itms::Subject.find_by!(itms_id: 100052),
        )
      end
    end

    context 'processed nrfc applications' do
      let (:nrfc_application) { Itms::NrfcApplicationProcessed.first }

      def sync_approved_nrfc_application
        expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zonfp/schvalene/1')
          .and_return(itms_json_fixture('zonfp_schvalena_item.json'))

        allow(downloader)
          .to receive(:href_exists?)
          .with('/v2/zonfp/schvalene/1')
          .and_return(true)

        allow(downloader)
          .to receive(:href_exists?)
          .with('/v2/zonfp/zamietnute/1')
          .and_return(false)

        subject.perform('/v2/zonfp/prijate/1', downloader: downloader)
      end

      def sync_rejected_nrfc_application
        expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zonfp/zamietnute/1')
          .and_return(itms_json_fixture('zonfp_zamietnuta_item.json'))

        expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zonfp/schvalene/1')
          .and_return(false)

        expect(downloader)
          .to receive(:href_exists?)
          .with('/v2/zonfp/zamietnute/1')
          .and_return(true)

        subject.perform('/v2/zonfp/prijate/1', downloader: downloader)
      end

      def expect_processed_attributes(nrfc_application)
        expect(nrfc_application).to have_attributes(
          itms_id: 1,
          itms_created_at: DateTime.parse('2015-09-25T08:08:04.391Z'),
          itms_updated_at: DateTime.parse('2017-02-28T16:51:30.730102Z'),

          akronym: "ZEN BSŠ SNV",
          aktivity_projekt: [
            Itms::NrfcApplicationProcessedActivity.find_by!(
              kod: "219A01100001",
              nazov: "Vodovodná sieť",
              subjekt: Itms::Subject.find_by!(itms_id: 100052),
              typ_aktivity: Itms::ActivityType.find_by!(itms_id: 219),
              ),
            Itms::NrfcApplicationProcessedActivity.find_by!(
              kod: "310A011P0001",
              nazov: "Podporné aktivity",
              subjekt: Itms::Subject.find_by!(itms_id: 100052),
              typ_aktivity: Itms::ActivityType.find_by!(itms_id: 790),
            ),
          ],
          formy_financovania: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1037, 1).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1037, 1).first!,
          ],
          hodnotitelia: [
            Itms::Person.find_by!(
              itms_id: 846,
              meno_uplne: 'Ing. Rudolf Pojezdala',
              ),
            Itms::Person.find_by!(
              itms_id: 851,
              meno_uplne: 'Ing. Michal Maňko, PhD.',
              )
          ],
          hospodarske_cinnosti: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1038, 22).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1038, 22).first!,
          ],
          kod: "NFP310010A011",
          meratelne_ukazovatele: [
            Itms::NrfcApplicationProcessedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 756,
              priznak_rizika: true,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 218)
            ),
            Itms::NrfcApplicationProcessedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 140,
              priznak_rizika: true,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 223)
            ),
            Itms::NrfcApplicationProcessedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 0,
              priznak_rizika: false,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 216)
            ),
            Itms::NrfcApplicationProcessedMeasurableIndicator.find_by!(
              hodnota_cielova_celkova: 6.6035.to_d,
              priznak_rizika: false,
              projektovy_ukazovatel: Itms::ProjectIndicator.find_by!(itms_id: 213)
            ),
            Itms::NrfcApplicationProcessedMeasurableIndicator.find_by!(
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
          pocet_bodov_hodnotenia_celkovy: 37,
          polozky_rozpoctu: [
            Itms::NrfcApplicationProcessedBudgetItem.find_by!(
              itms_id: 876,
              aktivita_zonfp_kod: "219A01100001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 27).first!,
              suma_opravneneho_vydavku: 11097.88.to_d
            ),
            Itms::NrfcApplicationProcessedBudgetItem.find_by!(
              itms_id: 877,
              aktivita_zonfp_kod: "219A01100001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 4).first!,
              suma_opravneneho_vydavku: 465444.9.to_d
            ),
            Itms::NrfcApplicationProcessedBudgetItem.find_by!(
              itms_id: 878,
              aktivita_zonfp_kod: "217A01100002",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 4).first!,
              suma_opravneneho_vydavku: 3499023.09.to_d
            ),
            Itms::NrfcApplicationProcessedBudgetItem.find_by!(
              itms_id: 879,
              aktivita_zonfp_kod: "217A01100002",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 27).first!,
              suma_opravneneho_vydavku: 83429.26.to_d
            ),
            Itms::NrfcApplicationProcessedBudgetItem.find_by!(
              itms_id: 880,
              aktivita_zonfp_kod: "310A011P0001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 16).first!,
              suma_opravneneho_vydavku: 33435.58.to_d
            ),
            Itms::NrfcApplicationProcessedBudgetItem.find_by!(
              itms_id: 881,
              aktivita_zonfp_kod: "310A011P0001",
              skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 15).first!,
              suma_opravneneho_vydavku: 2772.44.to_d
            ),
          ],
          popis_kapacity_ziadatela: "\u003cdiv\u003eInvestorom projektu a\u0026nbsp;žiadateľom o\u0026nbsp;NFP je Turčianska vod\u0026aacute;rensk\u0026aacute; spoločnosť, a.s. (Turvod).\u0026nbsp;Turvod Martin je n\u0026aacute;stupn\u0026iacute;ckou spoločnosťou Severoslovenskej vod\u0026aacute;renskej spoločnosti, a.s. Žilina. Vznikol z\u0026aacute;pisom do obchodn\u0026eacute;ho. Žiadateľ bude z\u0026aacute;roveň aj prev\u0026aacute;dzkovateľom projektu v\u0026nbsp;zmysle z\u0026aacute;kona č.\u0026nbsp;442/2002 Z.z. o\u0026nbsp;verejn\u0026yacute;ch vodovodoch a\u0026nbsp;verejn\u0026yacute;ch kanaliz\u0026aacute;ci\u0026aacute;ch.\u003c/div\u003e\u003cdiv\u003eTurčianska vod\u0026aacute;rensk\u0026aacute; spoločnosť, a.s. m\u0026aacute; opr\u0026aacute;vnenie na odborn\u0026uacute; sp\u0026ocirc;sobilosť na prev\u0026aacute;dzku verejn\u0026yacute;ch vodovodov a kanaliz\u0026aacute;ci\u0026iacute; podľa platnej legislat\u0026iacute;vy a\u0026nbsp;z\u0026aacute;roveň bohat\u0026eacute; sk\u0026uacute;senosti s realiz\u0026aacute;ciou projektov spolufinancovan\u0026yacute;ch nielen\u0026nbsp;zo zdrojov E\u0026Uacute;, z\u0026nbsp;ktor\u0026yacute;ch najv\u0026auml;č\u0026scaron;\u0026iacute; je projekt ISPA/KF \u0026bdquo;Kanaliz\u0026aacute;cia a čistenie odpadov.ch v\u0026ocirc;d v meste Martin a regi\u0026oacute;ne Doln\u0026yacute; Turiec\u0026ldquo;, 2004\u0026ndash;2008, 14,2 mil. \u0026euro;. Ďal\u0026scaron;ie projekty financovan\u0026eacute; z\u0026nbsp;KF v\u0026nbsp;r\u0026aacute;mci OPŽP: Necpaly \u0026ndash; kanaliz\u0026aacute;cia, Martin-Ostredok, vodovod, Martin \u0026ndash;odkanalizovanie MČ Tomčany \u0026ndash; IBV pri Jord\u0026aacute;ne.\u003c/div\u003e\u003cdiv\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv\u003e\u003cdiv\u003eIntern\u0026aacute;\u0026nbsp;finančn\u0026aacute; kontrola projektu, riadenie projektu a publicita a informovanosť (okrem informačnej a\u0026nbsp;pam\u0026auml;tnej tabule) bud\u0026uacute; vykon\u0026aacute;van\u0026eacute; vlastn\u0026yacute;mi kapacitami žiadateľa a vo vlastnej r\u0026eacute;žii. Navrhovan\u0026uacute; kanaliz\u0026aacute;ciu bude prev\u0026aacute;dzkovať žiadateľ v s\u0026uacute;lade s vyhl\u0026aacute;\u0026scaron;kou MŽPSRč.55/2004Z.z.\u003c/div\u003e\u003cdiv\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv\u003eDoplňuj\u0026uacute;ce podklady k\u0026nbsp;riadeniu projektu s\u0026uacute; doplnen\u0026eacute; v\u0026nbsp;r\u0026aacute;mci samostatn\u0026eacute;ho listu s\u0026nbsp;n\u0026aacute;zvom Doplňuj\u0026uacute;ce \u0026uacute;daje k\u0026nbsp;Formul\u0026aacute;ru ŽoNFP \u0026ndash; tab. č. 7.4 Administrat\u0026iacute;vna a\u0026nbsp;prev\u0026aacute;dzkov\u0026aacute; kapacita žiadateľa.\u003c/div\u003e\u003c/div\u003e",
          popis_projektu: "\u003cdiv\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003e\u0026Uacute;čelom projektu je dobudovanie kanaliz\u0026aacute;cie a\u0026nbsp;odvedenie OV z\u0026nbsp;doposiaľ neodkanalizovan\u0026yacute;ch čast\u0026iacute; obce ako aj z\u0026nbsp;novo navrhovanej IBV\u0026nbsp;v obci Turčiansky Peter a Ko\u0026scaron;ťany nad Turcom. Tak isto projekt rie\u0026scaron;i aj v\u0026yacute;stavbu vodovodnej siete pre novo navrhovan\u0026uacute; IBV v obci Turčiansky Peter a Ko\u0026scaron;ťany nad Turcom v spoločnej ryhe s kanaliz\u0026aacute;ciou.\u0026nbsp;Dobudovanie odkanalizovania obci\u0026nbsp;je navrhnut\u0026eacute; gravitačnou spla\u0026scaron;kovou kanaliz\u0026aacute;ciou s\u0026nbsp;miestnym prečerp\u0026aacute;van\u0026iacute;m spla\u0026scaron;kov\u0026yacute;ch odpadov\u0026yacute;ch v\u0026ocirc;d cez čerpacie stanice a čisten\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d na ČOV Vr\u0026uacute;tky.\u0026nbsp;Dobudovan\u0026iacute;m kanaliz\u0026aacute;cie a t\u0026yacute;m i odveden\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d z\u0026nbsp;neodkanalizovan\u0026yacute;ch čast\u0026iacute; spom\u0026iacute;nan\u0026yacute;ch obc\u0026iacute;\u0026nbsp;sa jednoznačne zlep\u0026scaron;\u0026iacute; životn\u0026eacute; prostredie v\u0026nbsp;regi\u0026oacute;ne. Zlikviduj\u0026uacute; sa žumpy, ktor\u0026eacute; m\u0026ocirc;žu byť netesn\u0026eacute; a zamedz\u0026iacute; sa nekontrolovateľn\u0026eacute;mu vyp\u0026uacute;\u0026scaron;ťaniu spla\u0026scaron;kov\u0026yacute;ch v\u0026ocirc;d. V r\u0026aacute;mci projektu sa vybuduje 6,6035 km spla\u0026scaron;kovej kanaliz\u0026aacute;cie, vyhotov\u0026iacute; sa 270 kanalizačn\u0026yacute;ch za\u0026uacute;sten\u0026iacute; ďalej sa vybuduje 2,516 km vodovodn\u0026eacute;ho potrubia s toho je 2,099 km veden\u0026eacute; spoločnej v jednej ryhe so spla\u0026scaron;kovou kanaliz\u0026aacute;ciou. V r\u0026aacute;mci projektu sa zv\u0026yacute;\u0026scaron;i počet obyvateľov so zlep\u0026scaron;en\u0026yacute;m čisten\u0026iacute;m OV o 756 obyvateľov a zasobovan\u0026iacute;m pitnou vodou o 140 obyvateľov. V\u0026nbsp;s\u0026uacute;časnosti je pripojen\u0026yacute;ch na spla\u0026scaron;kov\u0026uacute; kanaliz\u0026aacute;ciu s\u0026nbsp;čisten\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d na\u0026nbsp;ČOV Vr\u0026uacute;tky 2 326 obyvateľov. Po vybudovan\u0026iacute; projektu bude napojen\u0026yacute;ch na spla\u0026scaron;kov\u0026uacute; kanaliz\u0026aacute;ciu s\u0026nbsp;čisten\u0026iacute;m OV na ČOV Vr\u0026uacute;tky v\u0026nbsp;predmetnej aglomer\u0026aacute;cii 3 082 obyvateľov.\u003c/div\u003e\u003c/div\u003e",
          popis_situacie_po_realizacii: "\u003cdiv\u003e\u003cspan style=\"line-height:20.8px\"\u003eVybudovan\u0026aacute; kanaliz\u0026aacute;cia bude napojen\u0026aacute; na existuj\u0026uacute;ci zberač stokov\u0026eacute;ho syst\u0026eacute;mu Martin a\u0026nbsp;odpadov\u0026eacute; vody bud\u0026uacute; odveden\u0026eacute; a\u0026nbsp;čisten\u0026eacute; na ČOV Vr\u0026uacute;tky, ktor\u0026aacute; vyhovuje tak z\u0026nbsp;hľadiska kapacity ako aj kvality čistenia odpadov\u0026yacute;ch v\u0026ocirc;d.\u003c/span\u003e\u003c/div\u003e\u003cdiv\u003eRoz\u0026scaron;\u0026iacute;ren\u0026iacute;m existuj\u0026uacute;cej kanalizačnej siete aglomer\u0026aacute;cie Žabokreky d\u0026ocirc;jde k pripojeniu nenapojen\u0026yacute;ch obyvateľov a\u0026nbsp;odvedeniu odpadov\u0026yacute;ch v\u0026ocirc;d na ČOV Vr\u0026uacute;tky, ktor\u0026aacute; bola rekon\u0026scaron;truovan\u0026aacute; v\u0026nbsp;prostriedkov E\u0026Uacute; (ISPA) pr\u0026aacute;ve pre tento \u0026uacute;čel. Realiz\u0026aacute;cia projektu eliminuje znečisťovanie životn\u0026eacute;ho prostredia\u0026nbsp;\u003cspan style=\"line-height:20.8px\"\u003e(kontamin\u0026aacute;cia podzemn\u0026yacute;ch, povrchov\u0026yacute;ch v\u0026ocirc;d a p\u0026ocirc;dy spla\u0026scaron;kov\u0026yacute;mi odpadov\u0026yacute;mi vodami)\u003c/span\u003e\u003cspan style=\"line-height:1.6em\"\u003e, vytvoria sa kvalitnej\u0026scaron;ie životn\u0026eacute; podmienky pre obyvateľstvo a zv\u0026yacute;\u0026scaron;i sa konkurencieschopnosť regi\u0026oacute;nu.\u0026nbsp;\u003c/span\u003e\u003cspan style=\"line-height:1.6em\"\u003eProjekt prispeje k plneniu z\u0026aacute;v\u0026auml;zkov SR voči E\u0026Uacute; v oblasti odv\u0026aacute;dzania a čistenia komun\u0026aacute;lnych odpadov\u0026yacute;ch v\u0026ocirc;d.\u003c/span\u003e\u003c/div\u003e\u003cdiv\u003e\u003cdiv\u003e\u003cspan style=\"line-height:1.6em\"\u003eRealiz\u0026aacute;ciou projektu sa v\u0026nbsp;aglomer\u0026aacute;cii Žabokreky spln\u0026iacute; minim\u0026aacute;lny limit napojenosti 85% a\u0026nbsp;aglomer\u0026aacute;cia bude považovan\u0026aacute; za vyrie\u0026scaron;en\u0026uacute;.\u003c/span\u003e\u003c/div\u003e\u003c/div\u003e\u003cdiv\u003e\u003cspan style=\"line-height:20.8px\"\u003eNovovybudovan\u0026uacute; kanalizačn\u0026uacute; sieť bude prev\u0026aacute;dzkovať žiadateľ, t.j. Turčianska vod\u0026aacute;rensk\u0026aacute; spoločnosť, a.s.\u003c/span\u003e\u003c/div\u003e\u003cdiv\u003eV\u0026yacute;sledky finančnej anal\u0026yacute;zy preuk\u0026aacute;zali, že projekt je možn\u0026eacute; realizovať len s\u0026nbsp;pomocou nen\u0026aacute;vratn\u0026eacute;ho finančn\u0026eacute;ho pr\u0026iacute;spevku. Čist\u0026eacute; prev\u0026aacute;dzkov\u0026eacute; pr\u0026iacute;jmy projektu nepokr\u0026yacute;vaj\u0026uacute; investičn\u0026eacute; v\u0026yacute;davky v\u0026nbsp;plnej v\u0026yacute;\u0026scaron;ke. Na z\u0026aacute;klade podmienok poskytnutia pomoci pre projekty generuj\u0026uacute;ce pr\u0026iacute;jmy bol vypoč\u0026iacute;tan\u0026yacute; nen\u0026aacute;vratn\u0026yacute; finančn\u0026yacute; pr\u0026iacute;spevok a\u0026nbsp;stanoven\u0026aacute; \u0026scaron;trukt\u0026uacute;ra financovania projektu.\u003c/div\u003e\u003cdiv\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv\u003e\u003cspan style=\"line-height:1.6em\"\u003eVybudovanie predmetnej infra\u0026scaron;trukt\u0026uacute;ry je verejnoprospe\u0026scaron;n\u0026yacute; projekt s pozit\u0026iacute;vnym vplyvom na životn\u0026eacute; prostredie, ktor\u0026yacute; trvalo rie\u0026scaron;i probl\u0026eacute;m znečisťovania životn\u0026eacute;ho prostredia komun\u0026aacute;lnymi odpadov\u0026yacute;mi vodami a\u0026nbsp;navy\u0026scaron;e prinesie zlep\u0026scaron;enie kvality života občanov a pribl\u0026iacute;ženie sa \u0026scaron;tandardu vyspel\u0026yacute;m krajin\u0026aacute;m E\u0026Uacute; z hľadiska vybavenosti s\u0026iacute;deln\u0026yacute;ch aglomer\u0026aacute;ci\u0026iacute; verejnou infra\u0026scaron;trukt\u0026uacute;rou.\u003c/span\u003e\u003c/div\u003e",
          popis_sposobu_realizacie: "\u003cdiv style=\"line-height: 20.8px;\"\u003eStanoven\u0026eacute; ciele navrhovan\u0026eacute;ho projektu bud\u0026uacute; dosiahnut\u0026eacute; prostredn\u0026iacute;ctvom realiz\u0026aacute;cie aktiv\u0026iacute;t, ktor\u0026aacute;\u0026nbsp;pozost\u0026aacute;va z nasledovn\u0026yacute;ch stavieb:\u003cbr /\u003e-Trnovo, Trebostovo, Turčiansky Peter\u0026ndash;kanaliz\u0026aacute;cia,aktivita č\u0026iacute;slo 1-Turčiansky Peter\u003cbr /\u003e-Trnovo, Trebostovo, Turčiansky Peter-kanaliz\u0026aacute;cia-doplnok č.1-IBV H\u0026aacute;je\u003cbr /\u003e-IBV Ko\u0026scaron;ťany nad Turcom Tr\u0026aacute;vniky-Z\u0026aacute;pad.\u003cbr /\u003eHlavn\u0026eacute; aktivity projektu s\u0026uacute; stokov\u0026aacute; sieť a vodovodn\u0026aacute; sieť. V\u0026yacute;stavba stokovej siete je navrhnut\u0026aacute; pre jestvuj\u0026uacute;cu ako aj novo navrhovan\u0026uacute; (stavebne už zah\u0026aacute;jen\u0026uacute;) z\u0026aacute;stavbu a v\u0026yacute;stavba vodovodnej siete je navrhnut\u0026aacute; v novo navrhovanej z\u0026aacute;stavbe rie\u0026scaron;en\u0026yacute;ch obc\u0026iacute;.\u0026nbsp;Vodovodn\u0026aacute; sieť do žiadosti o nen\u0026aacute;vratn\u0026yacute; finančn\u0026yacute; pr\u0026iacute;spevok bola zahrnut\u0026aacute; do opr\u0026aacute;vnen\u0026yacute;ch v\u0026yacute;davkov iba tam, kde je veden\u0026aacute; spoločne\u0026nbsp;v jednej ryhe so spla\u0026scaron;kovou kanaliz\u0026aacute;ciou,\u0026nbsp;\u003cbr /\u003eNa realiz\u0026aacute;ciu pr\u0026aacute;c v r\u0026aacute;mci aktivity je uzavret\u0026aacute; zmluva s \u0026uacute;spe\u0026scaron;n\u0026yacute;m uch\u0026aacute;dzačom verejn\u0026eacute;ho obstar\u0026aacute;vania ( ZoD na pr\u0026aacute;ce zo dňa\u0026nbsp;12.8.2011,dod\u0026aacute;vateľ GFCH spol. s r.o., Žilina). Taktiež je uzavret\u0026aacute; zmluva na poskytnutie služieb stavebn\u0026eacute;ho dozoru (zo dňa 20.07.2011, poskytovateľ služieb ESP Consult, s.r.o., \u0026Scaron;amor\u0026iacute;n a AP Investing, s.r.o., Brno).\u003cbr /\u003eHlavn\u0026eacute; indik\u0026aacute;tory, ktor\u0026eacute; sa bud\u0026uacute; použ\u0026iacute;vať pre monitorovanie skutočn\u0026eacute;ho fyzick\u0026eacute;ho napredovania realiz\u0026aacute;cie, bud\u0026uacute; okrem\u0026nbsp;stanoven\u0026yacute;ch merateľn\u0026yacute;ch ukazovateľov projektu aj stavebn\u0026eacute; objekty a prev\u0026aacute;dzkov\u0026eacute; s\u0026uacute;bory jednotliv\u0026yacute;ch stavieb. Intern\u0026aacute; finančn\u0026aacute; kontrola projektu, riadenie projektu a publicita a informovanosť (okrem informačnej a\u0026nbsp;pam\u0026auml;tnej tabule) bud\u0026uacute; vykon\u0026aacute;van\u0026eacute; vlastn\u0026yacute;mi kapacitami žiadateľa a vo vlastnej r\u0026eacute;žii.\u0026nbsp;\u003c/div\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003e\u003cdiv\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv\u003eMateri\u0026aacute;ly, stavebn\u0026eacute; diely a v\u0026yacute;robky zabezpečovan\u0026eacute; Zhotoviteľom musia byť v\u0026nbsp;s\u0026uacute;lade s\u0026nbsp;požiadavkami na materi\u0026aacute;ly, stavebn\u0026eacute; diely a\u0026nbsp;parametre v\u0026yacute;robkov uveden\u0026yacute;ch v\u0026nbsp;dokument\u0026aacute;cii pre realiz\u0026aacute;ciu stavby resp.\u0026nbsp;vo v\u0026yacute;kazoch v\u0026yacute;mer, ktor\u0026eacute; boli s\u0026uacute;časťou s\u0026uacute;ťažn\u0026yacute;ch podkladov ako aj so z\u0026aacute;konom č. 314/2004 Z.z. o\u0026nbsp;stavebn\u0026yacute;ch v\u0026yacute;robkoch (\u0026uacute;pln\u0026eacute; znenie z\u0026aacute;kona 90/1998 Z.z.).Zhotoviteľ pred zabudovan\u0026iacute;m materi\u0026aacute;lov a\u0026nbsp;zariaden\u0026iacute; do Diela je povinn\u0026yacute; odovzdať certifik\u0026aacute;ty v\u0026scaron;etk\u0026yacute;ch tak\u0026yacute;chto materi\u0026aacute;lov, stavebn\u0026yacute;ch dielov a\u0026nbsp;v\u0026yacute;robkov Stavebn\u0026eacute;mu dozoru na schv\u0026aacute;lenie. Zhotoviteľ nesmie zabudovať do Diela žiadne materi\u0026aacute;ly, stavebn\u0026eacute; diely alebo v\u0026yacute;robky bez s\u0026uacute;hlasu Stavebn\u0026eacute;ho dozoru. Ku v\u0026scaron;etk\u0026yacute;m materi\u0026aacute;lom prich\u0026aacute;dzaj\u0026uacute;cim do priameho styku s\u0026nbsp;pitnou vodou mus\u0026iacute; Zhotoviteľ doložiť platn\u0026eacute; certifik\u0026aacute;ty o\u0026nbsp;vhodnosti materi\u0026aacute;lov pre styk s\u0026nbsp;pitnou vodou. Certifik\u0026aacute;ty bud\u0026uacute; vydan\u0026eacute; akreditovan\u0026yacute;m sk\u0026uacute;\u0026scaron;obn\u0026yacute;m \u0026uacute;stavom a\u0026nbsp;bud\u0026uacute; mať platnosť až do podp\u0026iacute;sania Preberacieho protokolu.\u003c/div\u003e\u003cdiv\u003eĎalej je zhotoviteľ \u0026nbsp;povinn\u0026yacute; počas realiz\u0026aacute;cie Diela zabezpečovať kontroln\u0026eacute; sk\u0026uacute;\u0026scaron;ky použit\u0026yacute;ch materi\u0026aacute;lov ako aj stavebn\u0026yacute;ch čast\u0026iacute; Diela podľa STN. \u0026nbsp;S\u0026uacute;časťou preberac\u0026iacute;ch sk\u0026uacute;\u0026scaron;ok gravitačn\u0026yacute;ch potrub\u0026iacute; bude monitoring vykon\u0026aacute;van\u0026yacute; priemyselnou kamerou s možnosťou zobrazenia sklonov.\u003c/div\u003e\u003c/div\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003ePri pr\u0026aacute;ci s mechanizmami, resp. manipul\u0026aacute;cii v ich dosahu je potrebn\u0026eacute; zabezpečiť ochranu zdravia a bezpečnosti pr\u0026aacute;ce v s\u0026uacute;lade s predp\u0026iacute;san\u0026yacute;mi požiadavkami pre tieto zariadenia. Pr\u0026aacute;ce m\u0026ocirc;žu vykon\u0026aacute;vať len osoby opr\u0026aacute;vnen\u0026eacute;, sp\u0026ocirc;sobil\u0026eacute; a n\u0026aacute;ležite poučen\u0026eacute;.\u0026nbsp;Počas v\u0026yacute;stavby a prev\u0026aacute;dzkovania kanaliz\u0026aacute;cie bude potrebn\u0026eacute; dodržiavať aktu\u0026aacute;lne platn\u0026eacute; predpisy o bezpečnosti pr\u0026aacute;ce, s\u0026uacute;visiace predpisy a nariadenia, hlavne ustanovenia Z\u0026aacute;kona č.124/2006 Z.z. o bezpečnosti a ochrane zdravia pri pr\u0026aacute;ci.\u0026nbsp;Pr\u0026aacute;ce sa bud\u0026uacute; vykon\u0026aacute;vať za plnej alebo čiastočnej prev\u0026aacute;dzky niektor\u0026yacute;ch vodovodov, stokov\u0026yacute;ch siet\u0026iacute; a\u0026nbsp;ČOV. Pre tieto pr\u0026aacute;ce Zhotoviteľ vypracuje n\u0026aacute;vrh \u0026quot;Dohody o vytvoren\u0026iacute; podmienok BOZP na spoločnom pracovisku\u0026quot;, ktor\u0026aacute; sa po jej ods\u0026uacute;hlasen\u0026iacute; Objedn\u0026aacute;vateľom stane pr\u0026iacute;lohou p\u0026iacute;somnej zmluvy podľa \u0026sect; 18 z\u0026aacute;k. č. 124/2006 Z.z.\u003c/div\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003e\u003cdiv\u003ePoloha a\u0026nbsp;situovanie vodovodn\u0026yacute;ch a stokovej siete\u0026nbsp;bude re\u0026scaron;pektovať jestvuj\u0026uacute;cu infra\u0026scaron;trukt\u0026uacute;ru v\u0026nbsp;obciach. Trasovanie jestvuj\u0026uacute;cej infra\u0026scaron;trukt\u0026uacute;ry ako aj novo navrhovan\u0026eacute; kanalizačn\u0026eacute; siete boli zakreslen\u0026eacute; do katastr\u0026aacute;lnych m\u0026aacute;p a do zamerania. V\u0026nbsp;stupni pre stavebn\u0026eacute; povolenie s\u0026uacute; trasy\u0026nbsp; kanalizačn\u0026yacute;ch siet\u0026iacute; upraven\u0026eacute; tak, aby re\u0026scaron;pektovali ochrann\u0026eacute; p\u0026aacute;sma jestvuj\u0026uacute;cej infra\u0026scaron;trukt\u0026uacute;ry. V\u0026nbsp;niektor\u0026yacute;ch\u0026nbsp;pr\u0026iacute;padoch doch\u0026aacute;dza k\u0026nbsp;preložke vodovodu z\u0026nbsp;d\u0026ocirc;vodu vedenia kanalizačnej site v\u0026nbsp;s\u0026uacute;behu v\u0026nbsp;tesnej bl\u0026iacute;zkosti. Nakoľko s\u0026uacute; trasy veden\u0026eacute; v\u0026nbsp;jestvuj\u0026uacute;cich \u0026scaron;t\u0026aacute;tnych cest\u0026aacute;ch, miestnych komunik\u0026aacute;ci\u0026aacute;ch, zelen\u0026yacute;ch p\u0026aacute;soch a\u0026nbsp;chodn\u0026iacute;kov nemalo by d\u0026ocirc;jsť ku zmene parciel cez ktor\u0026eacute; bude prech\u0026aacute;dzať navrhovan\u0026aacute; kanalizačn\u0026aacute; sieť. V\u0026yacute;stavbou sa skvalitn\u0026iacute; technick\u0026aacute; vybavenosť oblasti. Situovanie objektov kanaliz\u0026aacute;cie re\u0026scaron;pektuje \u0026uacute;zemn\u0026eacute; pl\u0026aacute;ny obc\u0026iacute; Turčiansky Peter a Ko\u0026scaron;ťany nad Turcom, a\u0026nbsp;v\u0026yacute;hľadov\u0026eacute; z\u0026oacute;ny rozvoja individu\u0026aacute;lnej bytovej v\u0026yacute;stavby v\u0026nbsp;jednotliv\u0026yacute;ch čast\u0026iacute; obc\u0026iacute;. Kanalizačn\u0026yacute; syst\u0026eacute;m predmetnej lokality je dobudovan\u0026yacute; tak, že po zrealizovan\u0026yacute; uveden\u0026yacute;ch kanaliz\u0026aacute;ci\u0026iacute; bude možn\u0026eacute; ihneď napojenie nehnuteľnost\u0026iacute;\u003cspan style=\"color:#FF0000\"\u003e.\u0026nbsp;\u003c/span\u003eV\u0026yacute;stavba kanaliz\u0026aacute;cie v\u0026nbsp;obciach zasiahne do zastavan\u0026eacute;ho \u0026uacute;zemia a\u0026nbsp;preto m\u0026aacute; z\u0026aacute;ber v\u0026auml;zieb na ostatn\u0026uacute; infra\u0026scaron;trukt\u0026uacute;ru \u0026uacute;zemia. Trasy navrhovan\u0026yacute;ch kanalizačn\u0026yacute;ch siet\u0026iacute; ovplyvňuj\u0026uacute; už jestvuj\u0026uacute;ce inžinierske siete a\u0026nbsp;komunik\u0026aacute;cie.\u003cbr /\u003e\u0026nbsp;\u003c/div\u003e\u003c/div\u003e",
          popis_vychodiskovej_situacie: "\u003cdiv\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003ePredkladan\u0026yacute; projekt rie\u0026scaron;i dobudovanie kanaliz\u0026aacute;cie a\u0026nbsp;v\u0026yacute;stavbu vodovodnej siete v\u0026nbsp;aglomer\u0026aacute;cii Žabokreky. \u003cspan style=\"line-height:20.8px\"\u003eAglomer\u0026aacute;cia Žabokreky, ktor\u0026aacute; je spoločne s\u0026nbsp;ďal\u0026scaron;\u0026iacute;mi aglomer\u0026aacute;ciami Martin, Turany a Sučany napojen\u0026aacute; na spoločn\u0026uacute; ČOV Vr\u0026uacute;tky.\u0026nbsp;\u003c/span\u003eV\u0026nbsp;s\u0026uacute;časnosti je v\u0026nbsp;aglomer\u0026aacute;cii Žabokreky vybudovan\u0026eacute; 15,8 km\u0026nbsp;kanaliz\u0026aacute;cie s\u0026nbsp;počtom 2\u0026nbsp;326 obyvateľov napojen\u0026yacute;ch na spla\u0026scaron;kov\u0026uacute; kanaliz\u0026aacute;ciu s\u0026nbsp;čisten\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d na ČOV Vr\u0026uacute;tky s\u0026nbsp;celkov\u0026eacute;ho počtu 2\u0026nbsp;960 obyvateľov žij\u0026uacute;cich v\u0026nbsp;aglomer\u0026aacute;cii Žabokreky. Celkov\u0026eacute; percento pripojenia EO na stokov\u0026uacute; sieť v\u0026nbsp;s\u0026uacute;časnosti \u0026nbsp;je 75,03%. Ďalej je v\u0026nbsp;aglomer\u0026aacute;cii Žabokreky v\u0026nbsp;s\u0026uacute;častnosti vybudovan\u0026aacute; vodovodn\u0026aacute; sieť o\u0026nbsp;dĺžke 11,4 km s\u0026nbsp;počtom 2960 obyvateľov z\u0026aacute;sobovan\u0026yacute;ch pitnou vodou z verejn\u0026eacute;ho vodovodu.\u003cbr /\u003e\u0026nbsp;\u003cbr /\u003eSkupina už\u0026iacute;vaj\u0026uacute;ca v\u0026yacute;sledky projektu bud\u0026uacute; obyvatelia obce Turčiansky Peter a\u0026nbsp;Ko\u0026scaron;ťany nad Turcom a\u0026nbsp;občiansko-technick\u0026aacute; vybavenosť spom\u0026iacute;nan\u0026yacute;ch obc\u0026iacute;.\u003cbr /\u003e\u0026nbsp;\u003cbr /\u003eOdpadov\u0026eacute; vody od nepripojen\u0026eacute;ho obyvateľstva s\u0026uacute; zhromažďovan\u0026eacute; v žump\u0026aacute;ch a\u0026nbsp;likvidovan\u0026eacute; individu\u0026aacute;lne. Realiz\u0026aacute;ciou predkladan\u0026eacute;ho projektu sa dosiahne zlep\u0026scaron;enie životn\u0026eacute;ho prostredia, zabr\u0026aacute;ni sa znečisťovaniu podzemn\u0026yacute;ch a povrchov\u0026yacute;ch v\u0026ocirc;d a vytvoria sa podmienky pre ďal\u0026scaron;\u0026iacute; socio-ekonomick\u0026yacute; rozvoj dotknut\u0026yacute;ch obc\u0026iacute;.\u003c/div\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv style=\"line-height: 20.8px;\"\u003eČOV Vr\u0026uacute;tky bola rekon\u0026scaron;truovan\u0026aacute; a\u0026nbsp;intenzifikovan\u0026aacute; v\u0026nbsp;r\u0026aacute;mci predvstupov\u0026eacute;ho programu fondov E\u0026Uacute; (ISPA) na kapacitu, ktor\u0026uacute; je možn\u0026eacute; využiť v\u0026nbsp;r\u0026aacute;mci odkanalizovania predmetnej aglomer\u0026aacute;cie a\u0026nbsp;to spoločne z\u0026nbsp;čisten\u0026iacute;m OV z\u0026nbsp;hore uveden\u0026yacute;ch aglomer\u0026aacute;ci\u0026iacute;.\u003c/div\u003e\u003c/div\u003e",

          sekundarny_tematicky_okruh: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(16, 1044, 8).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(15, 1044, 8).first!,
          ],
          typy_uzemia: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(33, 1034, 3).first!,
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(39, 1034, 3).first!,
          ],
          uzemne_mechanizmy: [
            Itms::SpecificGoalCodelistValue.where_goal_and_codelist(9, 1043, 7).first!,
          ],
          vyzva: Itms::AnnouncedProposalCall.find_by!(itms_id: 1),
          zameranie_projektu: "Dopytovo-orientovaný projekt",
          ziadatel: Itms::Subject.find_by!(itms_id: 100052),
        )
      end

      it 'syncs approved applications and their attributes' do
        sync_approved_nrfc_application

        expect_processed_attributes(nrfc_application)
        expect(nrfc_application).to have_attributes(
          itms_href: "/v2/zonfp/schvalene/1",
          ekosystem_stav: 'schvalene',

          aktivity_projekt: [
            Itms::NrfcApplicationProcessedActivity.find_by!(
              datum_konca_schvaleny: DateTime.parse("2018-01-01"),
              datum_zaciatku_schvaleny: DateTime.parse("2016-04-01"),
              kod: "219A01100001",
            ),
            Itms::NrfcApplicationProcessedActivity.find_by!(
              datum_konca_schvaleny: DateTime.parse("2018-03-01"),
              datum_zaciatku_schvaleny: DateTime.parse("2016-04-01"),
              kod: "310A011P0001",
            ),
          ],

          datum_schvalenia: DateTime.parse('2016-01-20T00:00:00Z'),
          datum_schvaleny_konca_hlavnych_aktivit: DateTime.parse('2018-01-01T00:00:00Z'),
          datum_schvaleny_konca_realizacie: DateTime.parse('2018-03-01T00:00:00Z'),
          datum_schvaleny_zaciatku_hlavnych_aktivit: DateTime.parse('2016-04-01T00:00:00Z'),
          datum_schvaleny_zaciatku_realizacie: DateTime.parse('2016-04-01T00:00:00Z'),
          percento_schvalene_spolufinancovania: 0.9,
          suma_schvalena_celkova: 4095203.15,
          suma_schvalena_celkova_projektov_generujucich_prijem: 4095203.15,
          suma_schvalena_nfp: 3685682.83,
          suma_schvalena_vlastnych_zdrojov: 409520.32,
        )
      end

      it 'syncs rejected applications and their attributes' do
        sync_rejected_nrfc_application

        expect_processed_attributes(nrfc_application)
        expect(nrfc_application).to have_attributes(
          itms_href: "/v2/zonfp/zamietnute/1",
          ekosystem_stav: 'zamietnute',

          aktivity_projekt: [
            Itms::NrfcApplicationProcessedActivity.find_by!(
              datum_konca_planovany: DateTime.parse("2018-01-01"),
              datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
              kod: "219A01100001",
            ),
            Itms::NrfcApplicationProcessedActivity.find_by!(
              datum_konca_planovany: DateTime.parse("2018-03-01"),
              datum_zaciatku_planovany: DateTime.parse("2016-04-01"),
              kod: "310A011P0001",
            ),
          ],
          datum_zamietnutia: DateTime.parse('2015-11-24T00:00:00Z'),
          datum_ziadany_konca_hlavnych_aktivit: DateTime.parse("2018-01-01T00:00:00Z"),
          datum_ziadany_konca_realizacie: DateTime.parse("2018-03-01T00:00:00Z"),
          datum_ziadany_zaciatku_hlavnych_aktivit: DateTime.parse("2016-04-01T00:00:00Z"),
          datum_ziadany_zaciatku_realizacie: DateTime.parse("2016-04-01T00:00:00Z"),
          percento_ziadane_spolufinancovania: 0.9,
          suma_ziadana_celkova: 4095203.15,
          suma_ziadana_celkova_projektov_generujucich_prijem: 4095203.15,
          suma_ziadana_nfp: 3685682.83,
          suma_ziadana_vlastnych_zdrojov: 409520.32,
          vysledok_konania: Itms::CodelistValue.where_codelist_and_value(1062, 1).first!,
        )
      end

      context 'when state changes from approved to rejected' do
        it 'resets attributes specific to approved state' do
          sync_approved_nrfc_application
          sync_rejected_nrfc_application

          expect(nrfc_application).to have_attributes(
            itms_href: "/v2/zonfp/zamietnute/1",
            ekosystem_stav: 'zamietnute',

            aktivity_projekt: [
              Itms::NrfcApplicationProcessedActivity.find_by!(
                datum_konca_schvaleny: nil,
                datum_zaciatku_schvaleny: nil,
                kod: "219A01100001",
              ),
              Itms::NrfcApplicationProcessedActivity.find_by!(
                datum_konca_schvaleny: nil,
                datum_zaciatku_schvaleny: nil,
                kod: "310A011P0001",
              ),
            ],
            datum_schvalenia: nil,
            datum_schvaleny_konca_hlavnych_aktivit: nil,
            datum_schvaleny_konca_realizacie: nil,
            datum_schvaleny_zaciatku_hlavnych_aktivit: nil,
            datum_schvaleny_zaciatku_realizacie: nil,
            percento_schvalene_spolufinancovania: nil,
            suma_schvalena_celkova: nil,
            suma_schvalena_celkova_projektov_generujucich_prijem: nil,
            suma_schvalena_nfp: nil,
            suma_schvalena_vlastnych_zdrojov: nil,
          )
        end
      end

      context 'when state changes from rejected to approved' do
        it 'resets attributes specific to rejected state' do
          sync_rejected_nrfc_application
          sync_approved_nrfc_application

          expect(nrfc_application).to have_attributes(
            itms_href: "/v2/zonfp/schvalene/1",
            ekosystem_stav: 'schvalene',

            aktivity_projekt: [
              Itms::NrfcApplicationProcessedActivity.find_by!(
                datum_konca_planovany: nil,
                datum_zaciatku_planovany: nil,
                kod: "219A01100001",
              ),
              Itms::NrfcApplicationProcessedActivity.find_by!(
                datum_konca_planovany: nil,
                datum_zaciatku_planovany: nil,
                kod: "310A011P0001",
              ),
            ],
            datum_zamietnutia: nil,
            datum_ziadany_konca_hlavnych_aktivit: nil,
            datum_ziadany_konca_realizacie: nil,
            datum_ziadany_zaciatku_hlavnych_aktivit: nil,
            datum_ziadany_zaciatku_realizacie: nil,
            percento_ziadane_spolufinancovania: nil,
            suma_ziadana_celkova: nil,
            suma_ziadana_celkova_projektov_generujucich_prijem: nil,
            suma_ziadana_nfp: nil,
            suma_ziadana_vlastnych_zdrojov: nil,
            vysledok_konania: nil,
          )
        end
      end
    end
  end
end
