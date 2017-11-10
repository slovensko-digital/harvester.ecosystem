require 'rails_helper'

RSpec.describe Itms::SyncProjectIndicatorJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs discrepancy and all of its attributes' do
      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/hodnotaCiselnika/'))
          .and_return(double(body: itms_file_fixture('hodnota_ciselnika_item.json')))

      allow(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/ciselniky')
          .and_return(double(body: itms_file_fixture('ciselniky_list.json')))

      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/projektovyUkazovatel/1')
          .and_return(double(body: itms_file_fixture('projektovy_ukazovatel_item.json')))

      subject.perform('/v2/projektovyUkazovatel/1', downloader: downloader)

      expect(Itms::ProjectIndicator.first).to have_attributes(
        itms_href: '/v2/projektovyUkazovatel/1',
        itms_id: 1,
        itms_created_at: DateTime.parse('2015-05-18T09:09:08.405Z'),
        itms_updated_at: DateTime.parse('2017-09-11T15:15:46.455Z'),

        cas_plnenia: [
            Itms::CodelistValue.where_codelist_and_value(1088, 4).first!,
        ],
        definicia: '<div>Osoby vo veku do 29 rokov, ktor&eacute; s&uacute; bez pr&aacute;ce, k dispoz&iacute;cii pre pr&aacute;cu a akt&iacute;vne hľadaj&uacute;ce pr&aacute;cu, a z&aacute;roveň s&uacute; registrovan&eacute; na &uacute;radoch pr&aacute;ce a ktor&eacute; dokončia intervenciu IZM podľa harmonogramu až do posledn&eacute;ho dňa, resp. posledn&eacute;ho stretnutia podľa harmonogramu. Zamestnaneck&yacute; status sa určuje dňom vstupu do projektu. Vek &uacute;častn&iacute;ka sa poč&iacute;ta od roku narodenia a urč&iacute; sa v deň jeho vstupu do aktiv&iacute;t projektu./<br />Ukazovateľ sa vypoč&iacute;ta ako s&uacute;čet počtu os&ocirc;b vo veku do 29 rokov, ktor&eacute; s&uacute; bez pr&aacute;ce, k dispoz&iacute;cii pre pr&aacute;cu a akt&iacute;vne hľadaj&uacute;ce pr&aacute;cu, a z&aacute;roveň s&uacute; registrovan&eacute; na &uacute;radoch pr&aacute;ce a ktor&eacute; dokončia intervenciu IZM podľa harmonogramu až do posledn&eacute;ho dňa, resp. posledn&eacute;ho stretnutia podľa harmonogramu.<br />Počet sa bude zisťovať na z&aacute;klade&nbsp; monitorovac&iacute;ch spr&aacute;v a z v&yacute;stupn&yacute;ch zost&aacute;v ITMS.</div>',
        evidencia_podla_pohlavia: true,
        fondy: [
            Itms::CodelistValue.where_codelist_and_value(1032, 2).first!,
        ],
        kod: 'P0099',
        merna_jednotka: 'počet',
        nazov: 'Nezamestnaní účastníci, ktorí dokončia intervenciu podporovanú z prostriedkov vyčlenených na iniciatívu na podporu zamestnanosti mladých ľudí',
        platnost: true,
        typ_vypoctu: 'SUCET',
      )
    end
  end
end
