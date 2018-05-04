require 'rails_helper'

RSpec.describe Itms::SyncProcurementContractJob, type: :job do
  include_context "itms_downloader"
  let(:procurement) { Itms::Procurement.create!(itms_id: 123) }

  describe '#perform' do
    it 'syncs procurement contract and all of its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/zmluvaVerejneObstaravanie/342')
          .and_return(itms_json_fixture('zmluva_verejne_obstaravanie_item.json'))
          .once

      subject.perform('/v2/zmluvaVerejneObstaravanie/342', procurement, downloader: downloader)

      expect(Itms::ProcurementContract.first).to have_attributes(
        itms_id: 342,
        itms_href: '/v2/zmluvaVerejneObstaravanie/342',
        itms_created_at: DateTime.parse('0001-01-01T00:00:00Z'),
        itms_updated_at: DateTime.parse('0001-01-01T00:00:00Z'),

        celkova_suma_zmluvy: 341774.34,
        cislo_zmluvy: 'Objednávka č.122',
        dalsie_url: [
            Itms::ProcurementContractAdditionalUrl.find_by!(
                nazov: 'Dodatok č. 1',
                url: "http://www.crz.gov.sk/index.php?ID=1249239\u0026l=sk"
            ),
            Itms::ProcurementContractAdditionalUrl.find_by!(
                nazov: 'Dodtok č. 2',
                url: "http://www.crz.gov.sk/index.php?ID=1487203\u0026l=sk"
            ),
        ],
        datum_platnosti: DateTime.parse('2014-04-24T00:00:00Z'),
        datum_ucinnosti: DateTime.parse('2014-04-28T00:00:00Z'),
        dodavatelia: [
            Itms::ProcurementContractSupplier.find_by!(
              dodavatel_dodavatel_obstaravatel: Itms::Supplier.find_by!(itms_id: 260),
              dodavatel_subjekt: nil,
              je_hlavny_dodavatel: true
            ),
            Itms::ProcurementContractSupplier.find_by!(
              dodavatel_dodavatel_obstaravatel: nil,
              dodavatel_subjekt: Itms::Subject.find_by!(itms_id: 101027),
              je_hlavny_dodavatel: false
            ),

        ],
        hlavny_dodavatel_dodavatel_obstaravatel: Itms::Supplier.find_by!(itms_id: 260),
        hlavny_dodavatel_subjekt: Itms::Subject.find_by!(itms_id: 101027),
        kod: 'VO66152197001',
        nazov: 'Zmluva o dielo',
        predmet_zmluvy: "\u003cdiv\u003eZmluva o dielo \u0026quot;Roz\u0026scaron;\u0026iacute;renie kapacity ČOV Lozorno\u0026quot;, predmetom ktorej je:\u003c/div\u003e\u003cdiv\u003e- realizačn\u0026yacute; projekt technologickej časti\u003c/div\u003e\u003cdiv\u003e- dod\u0026aacute;vka strojnotechnologick\u0026eacute;ho a elektrick\u0026eacute;ho zariadenia\u003c/div\u003e\u003cdiv\u003e- v\u0026yacute;stavba a mont\u0026aacute;ž kompletn\u0026eacute;ho strojnotechnologick\u0026eacute;ho a elektrick\u0026eacute;ho zariadenia vr\u0026aacute;tane vykonania individu\u0026aacute;lnych a komplexn\u0026yacute;ch sk\u0026uacute;\u0026scaron;ok\u003c/div\u003e\u003cdiv\u003e- služby po mont\u0026aacute;ži: vypracovanie projektu skutočn\u0026eacute;ho vyhotovenia, vypracovanie doplnku prev\u0026aacute;dzkov\u0026eacute;ho poriadku, vypracovanie v\u0026yacute;chodiskovej spr\u0026aacute;vy o odbornej prehliadke a sk\u0026uacute;\u0026scaron;ke elektrick\u0026eacute;ho zariadenia\u003c/div\u003e\u003cdiv\u003e- z\u0026aacute;ručn\u0026yacute; servis počas 24 mesiacov od ukončenia mont\u0026aacute;že.\u003c/div\u003e\u003cdiv\u003e\u0026nbsp;\u003c/div\u003e",
        suma_bez_dph: 284811.95,
        url_odkaz_na_zmluvu: 'http://www.lozorno.sk/documents/dokumenty24//zmluva-o-dielo-hydrotech-as-2014-04-24.pdf',
        verejne_obstaravanie: procurement
      )
    end
  end
end
