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
        organizacne_zlozky: [
          Itms::OrganisationalUnit.find_by!(
            itms_id: 100,
            adresa: 'Bajkalská 27, 82799 Bratislava - mestská časť Ružinov',
            nazov: 'Sekcia energetických činností'
          ),
        ],
        otvorena_zmena: false,
        otvoreny_dodatok: false,
        partneri: [
          Itms::Subject.find_by!(itms_id: 100003)
        ],
        polozky_rozpoctu: [
          Itms::BudgetItem.find_by!(itms_id: 204),
          Itms::BudgetItem.find_by!(itms_id: 205),
          Itms::BudgetItem.find_by!(itms_id: 206),
          Itms::BudgetItem.find_by!(itms_id: 207),
          Itms::BudgetItem.find_by!(itms_id: 208),
        ],
        popis_projektu: "\u003cdiv\u003eCieľom\u0026nbsp;predkladan\u0026eacute;ho projektu je\u0026nbsp;zlep\u0026scaron;enie stavu odv\u0026aacute;dzania a čistenia komun\u0026aacute;lnych v\u0026ocirc;d v aglomer\u0026aacute;cii Veľk\u0026eacute; Lev\u0026aacute;re. D\u0026ocirc;vodom pre realiz\u0026aacute;ciu projektu je nevyhovuj\u0026uacute;ci stav v obciach Mal\u0026eacute; a Veľk\u0026eacute; Lev\u0026aacute;re, kde napojenosť obyvateľstva na kanalizačn\u0026uacute; sieť predstavuje len tretinu tohto obyvateľstva. Odpadov\u0026aacute; voda z uveden\u0026yacute;ch obc\u0026iacute; sa spracuv\u0026aacute;va v čistiarni odpadov\u0026yacute;ch v\u0026ocirc;d (ďalej len ČOV) v obci Gajary, ktor\u0026aacute; je kapacitne plne vyťažen\u0026aacute;. Ostatn\u0026iacute; občania zachyt\u0026aacute;vaj\u0026uacute; spla\u0026scaron;kov\u0026eacute; vody v žump\u0026aacute;ch, čo je rizikov\u0026eacute; najm\u0026auml; z pohľadu vplyvu na životn\u0026eacute; prostredie a z\u0026aacute;roveň aj na zdravie obyvateľstva.\u0026nbsp;\u003c/div\u003e\u003cdiv\u003eProjekt pozost\u0026aacute;va z nasledovn\u0026yacute;ch aktiv\u0026iacute;t:\u0026nbsp;\u003c/div\u003e\u003cdiv\u003ea. dobudovanie\u0026nbsp;kanalizačnej siete v aglomer\u0026aacute;cii Veľk\u0026eacute; Lev\u0026aacute;re\u003c/div\u003e\u003cdiv\u003eb. dobudovanie vodovodnej siete v obci Mal\u0026eacute; Lev\u0026aacute;re\u003c/div\u003e\u003cdiv\u003ec. zv\u0026yacute;\u0026scaron;enie kapacity \u003cspan style=\"background-color:rgb(255, 255, 255); color:rgb(51, 51, 51); line-height:20.8px\"\u003ečistiarne odpadov\u0026yacute;ch v\u0026ocirc;d \u003c/span\u003ev obci Gajary.\u003c/div\u003e\u003cdiv\u003eV\u0026yacute;sledkom projektu bude vybudovan\u0026aacute; kanalizačn\u0026aacute; sieť v celkovej dĺžke 22,74\u0026nbsp;km, vybudovan\u0026aacute; vodovodn\u0026aacute; sieť v dĺžke 3,62\u0026nbsp;km a zv\u0026yacute;\u0026scaron;en\u0026aacute; kapacita čistiarne odpadov\u0026yacute;ch v\u0026ocirc;d na 13 000 EO. Realizovan\u0026iacute;m projektu sa dosiahne zv\u0026yacute;\u0026scaron;en\u0026aacute; napojenosť obyvateľstva na kanalizačn\u0026eacute; siete na viac ako 90 %. Aktivity s\u0026uacute; v\u0026nbsp;s\u0026uacute;lade s\u0026nbsp;OP KŽP a s\u0026nbsp;Pl\u0026aacute;nom rozvoja verejn\u0026yacute;ch kanaliz\u0026aacute;ci\u0026iacute; v\u0026nbsp;SR. Cieľovou skupinou projektu s\u0026uacute; obyvatelia obc\u0026iacute; Veľk\u0026eacute; Lev\u0026aacute;re, Mal\u0026eacute; Lev\u0026aacute;re a Gajary.\u003c/div\u003e",
        popis_situacie_po_realizacii: "\u003cdiv\u003eSyst\u0026eacute;m kanaliz\u0026aacute;cie bude založen\u0026yacute; na prečerp\u0026aacute;van\u0026iacute; spla\u0026scaron;kovej vody z\u0026nbsp;obce Veľk\u0026eacute; Lev\u0026aacute;re\u0026nbsp;cez\u0026nbsp;sieť v obci Mal\u0026eacute; Lev\u0026aacute;re a n\u0026aacute;sledne do existuj\u0026uacute;cej ČOV Gajary, kde d\u0026ocirc;jde k jej čisteniu a vypusteniu do rieky Morava. Realiz\u0026aacute;cia a prev\u0026aacute;dzka ČOV bude zabezpečen\u0026aacute; samotn\u0026yacute;m žiadateľom i\u0026nbsp;extern\u0026yacute;m subjektom s\u0026nbsp;\u003cspan style=\"line-height:20.8px\"\u003eodbornou\u0026nbsp;sp\u0026ocirc;sobilosťou, b\u003c/span\u003eude dosiahnut\u0026aacute;\u0026nbsp;vysok\u0026aacute; kvalitat\u0026iacute;vna \u0026uacute;roveň t\u0026yacute;chto\u0026nbsp;procesov. Bud\u0026uacute; naplnen\u0026eacute; hodnoty merateľn\u0026yacute;ch ukazovateľov bez pr\u0026iacute;znaku, čo bude predpokladom pre dosiahnutie hodn\u0026ocirc;t merateľn\u0026yacute;ch ukazovateľov s pr\u0026iacute;znakom, a to\u0026nbsp;zv\u0026yacute;\u0026scaron;en\u0026yacute; počet EO so zlep\u0026scaron;en\u0026yacute;m čisten\u0026iacute;m komun\u0026aacute;lnych odpadov\u0026yacute;ch v\u0026ocirc;d a zv\u0026yacute;\u0026scaron;en\u0026yacute; počet EO so zlep\u0026scaron;enou dod\u0026aacute;vkou pitnej vody. Rie\u0026scaron;enie je najv\u0026yacute;hodnej\u0026scaron;\u0026iacute;m variantom z\u0026nbsp;hľadiska hospod\u0026aacute;rnosti i efekt\u0026iacute;vnosti. Vplyv diela na životn\u0026eacute; prostredie bude pozit\u0026iacute;vny. Dobudovan\u0026iacute;m kanaliz\u0026aacute;cie, ČOV,\u0026nbsp;vodovodu sa vytvoria podmienky na nez\u0026aacute;vadn\u0026eacute; čistenie odpadov\u0026yacute;ch v\u0026ocirc;d, č\u0026iacute;m sa negat\u0026iacute;vne dopady na životn\u0026eacute; prostredie eliminuj\u0026uacute; a d\u0026ocirc;jde k odstr\u0026aacute;neniu znečisťovania podzemn\u0026yacute;ch v\u0026ocirc;d, miera napojenia obyvateľstva st\u0026uacute;pne na viac ako 85%.\u0026nbsp;Zo socio-ekonomick\u0026eacute;ho hľadiska sa zv\u0026yacute;\u0026scaron;i životn\u0026aacute; \u0026uacute;roveň obyvateľov, nez\u0026aacute;vadn\u0026eacute; spracov\u0026aacute;vanie odpadov\u0026yacute;ch v\u0026ocirc;d\u0026nbsp;bude predpokladom\u0026nbsp;pre zv\u0026yacute;\u0026scaron;en\u0026yacute; z\u0026aacute;ujem o individu\u0026aacute;lnu\u0026nbsp;bytov\u0026uacute;\u0026nbsp;v\u0026yacute;stavbu i\u0026nbsp;realiz\u0026aacute;ciu investičn\u0026yacute;ch z\u0026aacute;merov.\u0026nbsp;\u003c/div\u003e",
        popis_sposobu_realizacie: "\u003cdiv\u003eStokov\u0026aacute; sieť\u0026nbsp;bude vybudovan\u0026aacute; v\u0026nbsp;obciach Mal\u0026eacute; Lev\u0026aacute;re,\u0026nbsp;Veľk\u0026eacute; Lev\u0026aacute;re. Celkov\u0026aacute; dĺžka pl\u0026aacute;novanej gravitačnej siete vr\u0026aacute;tane v\u0026yacute;tlačn\u0026eacute;ho potrubia je 22,74\u0026nbsp;km.\u0026nbsp;Odkanalizovanie obc\u0026iacute; je navrhnut\u0026eacute; gravitačnou spla\u0026scaron;kovou kanaliz\u0026aacute;ciou s miestnym prečerp\u0026aacute;van\u0026iacute;m odpadov\u0026yacute;ch v\u0026ocirc;d prostredn\u0026iacute;ctvom čerpac\u0026iacute;ch\u0026nbsp;stan\u0026iacute;c cez\u0026nbsp;ponorn\u0026eacute;\u0026nbsp;kalov\u0026eacute;\u0026nbsp;čerpadl\u0026aacute;\u0026nbsp;a v\u0026yacute;tlačn\u0026eacute;\u0026nbsp;potrubia. V\u0026nbsp;r\u0026aacute;mci v\u0026yacute;stavby bud\u0026uacute; na potrubie osaden\u0026eacute; odbočky pre napojenie domov\u0026yacute;ch\u0026nbsp;kanalizačn\u0026yacute;ch\u0026nbsp;pr\u0026iacute;pojok\u0026nbsp;z PVC v počte\u0026nbsp;\u003cspan style=\"background-color:rgb(255, 255, 255); color:rgb(51, 51, 51); line-height:20.8px\"\u003e1\u0026nbsp;051 ks. N\u0026aacute;sledn\u0026yacute;m r\u003c/span\u003eoz\u0026scaron;\u0026iacute;ren\u0026iacute;m pr\u0026iacute;slu\u0026scaron;nej ČOV Gajary sa zv\u0026yacute;\u0026scaron;i kapacita z teraj\u0026scaron;\u0026iacute;ch 6 500 EO na navrhovan\u0026yacute;ch 13\u0026nbsp;000 EO. Zv\u0026yacute;\u0026scaron;enie kapacity ČOV bude docielen\u0026eacute; v\u0026yacute;stavbou pr\u0026iacute;stavby existuj\u0026uacute;ceho objektu. Materi\u0026aacute;lovo i technologicky bude nov\u0026aacute; časť vybudovan\u0026aacute; sp\u0026ocirc;sobom ako existuj\u0026uacute;ci objekt.\u0026nbsp;Technol\u0026oacute;gia čistenia je navrhovnut\u0026aacute; na princ\u0026iacute;pe dlhodobej aktiv\u0026aacute;cie s \u0026uacute;plnou stabiliz\u0026aacute;ciou kalu v kalojemoch a mechanick\u0026yacute;m odvodnen\u0026iacute;m na p\u0026aacute;sovom lise. Projekt takisto poč\u0026iacute;ta s\u0026nbsp;vybudovan\u0026iacute;m 3,\u0026nbsp;62\u0026nbsp;km vodovodn\u0026eacute;ho potrubia a\u0026nbsp;197 vodovodn\u0026yacute;ch pr\u0026iacute;pojok v obci Mal\u0026eacute; Lev\u0026aacute;re. Stavebn\u0026eacute; pr\u0026aacute;ce\u0026nbsp;bud\u0026uacute; realizovan\u0026eacute; v obdob\u0026iacute; od 07/2016 do 12/2017. Dod\u0026aacute;vatelia na zabezpečenie odborn\u0026yacute;ch aktiv\u0026iacute;t projektu\u0026nbsp;bud\u0026uacute; vybran\u0026iacute; v s\u0026uacute;lade so z\u0026aacute;konom o VO.\u003c/div\u003e",
        popis_vychodiskovej_situacie: "\u003cdiv\u003eV s\u0026uacute;časnosti obce tvoriace aglomer\u0026aacute;ciu\u0026nbsp;Veľk\u0026eacute; Lev\u0026aacute;re \u003cspan style=\"line-height:20.8px\"\u003enemaj\u0026uacute;\u0026nbsp;\u003c/span\u003evybudovan\u0026uacute; kanaliz\u0026aacute;ciu na celom \u0026uacute;zem\u0026iacute;, pričom miera napojenia predstavuje približne tretina obyvateľov. Spla\u0026scaron;kov\u0026eacute; vody s\u0026uacute; zachyt\u0026aacute;van\u0026eacute; v žump\u0026aacute;ch, ktor\u0026eacute; nie je možn\u0026eacute; považovať za vyhovuj\u0026uacute;ce rie\u0026scaron;enie z hľadiska hygienick\u0026eacute;ho, ani z hľadiska ochrany podzemn\u0026yacute;ch v\u0026ocirc;d a životn\u0026eacute;ho prostredia. Žumpy s\u0026uacute; v častokr\u0026aacute;t netesn\u0026eacute;, nespr\u0026aacute;vne prev\u0026aacute;dzkovan\u0026eacute;, v d\u0026ocirc;sledku čoho\u0026nbsp;doch\u0026aacute;dza k znečisťovaniu povrchov\u0026yacute;ch aj podzemn\u0026yacute;ch v\u0026ocirc;d, ktor\u0026eacute; s\u0026uacute; z\u0026aacute;sob\u0026aacute;rňami pitnej vody.\u0026nbsp;\u0026Uacute;daje o\u0026nbsp;stave povrchov\u0026yacute;ch tokov v\u0026nbsp;profiloch obc\u0026iacute; dokazuj\u0026uacute; znečistenie uhl\u0026iacute;kat\u0026yacute;m, dus\u0026iacute;kat\u0026yacute;m a\u0026nbsp;fosforečn\u0026yacute;m znečisten\u0026iacute;m. Nakladanie s\u0026nbsp;odpadov\u0026yacute;m materi\u0026aacute;lom spoč\u0026iacute;va vo v\u0026yacute;voze obsahu ž\u0026uacute;mp na polia, kde sa tento materi\u0026aacute;l vylieva do ter\u0026eacute;nnych nerovnost\u0026iacute;. Uveden\u0026yacute; stav je jedin\u0026aacute; možnosť likvid\u0026aacute;cie tohto odpadu v\u0026nbsp;s\u0026uacute;časnosti. Uveden\u0026yacute; stav je neudržateľn\u0026yacute;, nakoľko m\u0026ocirc;že doch\u0026aacute;dzať k\u0026nbsp;\u0026uacute;niku odpadov\u0026yacute;ch v\u0026ocirc;d do podzemn\u0026yacute;ch v\u0026ocirc;d a\u0026nbsp;t\u0026yacute;m k\u0026nbsp;negat\u0026iacute;vnemu vplyvu na životn\u0026eacute;\u0026nbsp;prostredie\u0026nbsp;a\u0026nbsp;zdravie\u0026nbsp;obyvateľstva. Kapacita ČOV v obci Gajary v s\u0026uacute;časnosti je plne využit\u0026aacute; a\u0026nbsp;z tohto d\u0026ocirc;vodu je nevyhnutn\u0026eacute; jej kapacitu zv\u0026yacute;\u0026scaron;iť\u0026nbsp;vzhľadom na počet novonapojen\u0026yacute;ch obyvateľov i vzhľadom na možnosti rastu obc\u0026iacute;.\u0026nbsp;Vodovod v obci\u0026nbsp;Mal\u0026eacute; Lev\u0026aacute;re je potrebn\u0026eacute; dobudovať, v z\u0026aacute;ujme bezpečn\u0026eacute;ho z\u0026aacute;sobovania pitnou vodou..\u003c/div\u003e",
        popis_kapacity_prijimatela: "\u003cdiv\u003eProjektov\u0026yacute; t\u0026iacute;m bude zabezpečen\u0026yacute; person\u0026aacute;lnymi kapacitami žiadateľa v spojen\u0026iacute; s extern\u0026yacute;mi spolupracovn\u0026iacute;kmi.Odborn\u0026yacute;m garantom projektu bude predseda združenia, ktor\u0026yacute; \u0026uacute;spe\u0026scaron;ne realizoval investičn\u0026yacute; projekt v\u0026yacute;stavby ČOV a v\u0026yacute;stavbu kanaliz\u0026aacute;cie podporen\u0026yacute; z prostriedkov E\u0026Uacute; a \u0026Scaron;R. Projekt v pr\u0026iacute;pade podpory bude odborne riadiť projektov\u0026yacute; manaž\u0026eacute;r so sk\u0026uacute;senosťami s investičn\u0026yacute;mi projektami zameran\u0026yacute;mi na oblasti \u003cspan style=\"line-height:1.6em\"\u003eenvironment\u0026aacute;lne, cestovn\u0026yacute; ruch a zvy\u0026scaron;ovania konkurencieschopnosti v\u0026yacute;robn\u0026yacute;ch podnikov. Projektov\u0026yacute; t\u0026iacute;m bude v pravideln\u0026yacute;ch intervaloch zvol\u0026aacute;vať pracovn\u0026eacute; stretnutia spolu so z\u0026aacute;stupcami stavebn\u0026eacute;ho dozora a stavebnej firmy uskutočňuj\u0026uacute;cej stavebn\u0026eacute; pr\u0026aacute;ce. Cieľom stretnut\u0026iacute; bude kontrolovať harmonogram realiz\u0026aacute;cie pr\u0026aacute;c a t\u0026yacute;m dohliadať bezprobl\u0026eacute;mov\u0026uacute; realiz\u0026aacute;ciu. Ostatn\u0026eacute; aktivity ako p\u003c/span\u003e\u003cspan style=\"line-height:1.6em\"\u003er\u0026iacute;prava projektovej dokument\u0026aacute;cie, zabezpečenie verejn\u0026eacute;ho obstar\u0026aacute;vania v s\u0026uacute;lade so z\u0026aacute;konom o verejnom obstar\u0026aacute;van\u0026iacute; zabezpečuj\u0026uacute; osoby s množstvom sk\u0026uacute;senosti vo svojej problematike, pričom pri ich v\u0026yacute;bere boli bran\u0026eacute; do \u0026uacute;vahy ich referencie a sk\u0026uacute;senosti s oblasťou v\u0026yacute;stavby kanalizačn\u0026yacute;ch siet\u0026iacute; a ČOV\u003c/span\u003e\u003cspan style=\"line-height:1.6em\"\u003e.\u003c/span\u003e\u003cspan style=\"line-height:1.6em\"\u003e\u0026nbsp;Prev\u0026aacute;dzka ČOV po ukončen\u0026iacute; realiz\u0026aacute;cie aktiv\u0026iacute;t \u003c/span\u003e\u003cspan style=\"line-height:1.6em\"\u003eprojektu bude zabezpečen\u0026aacute; extern\u0026yacute;m spolupracovn\u0026iacute;kom s potrebn\u0026yacute;m know-how a technick\u0026yacute;m vybaven\u0026iacute;m na kvalitn\u0026yacute; proces prev\u0026aacute;dzky.\u0026nbsp; \u003c/span\u003e\u003c/div\u003e\u003cdiv\u003e\u003cspan style=\"line-height:1.6em\"\u003e\u0026quot;Doplňuj\u0026uacute;ce podklady k Riadeniu projektu s\u0026uacute; doplnen\u0026eacute; v r\u0026aacute;mci samostatn\u0026eacute;ho listu s n\u0026aacute;zvom Doplňuj\u0026uacute;ce \u0026uacute;daje k Formul\u0026aacute;ru ŽoNFP - tab. č. 7.4. Administrat\u0026iacute;vna a prev\u0026aacute;dzkov\u0026aacute; kapacita žiadateľa\u0026quot;.\u003c/span\u003e\u003c/div\u003e",

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
