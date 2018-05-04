require 'rails_helper'

RSpec.describe Itms::SyncPlannedProposalCallJob, type: :job do
  include_context 'itms_downloader'

  describe '#perform' do
    it 'syncs planned call for proposals and all of its attributes' do
      expect(downloader)
        .to receive(:get_json_from_href)
        .with('/v2/vyzvy/planovane/2')
        .and_return(itms_json_fixture('vyzva_planovana_item.json'))
        .once

      subject.perform('/v2/vyzvy/planovane/2', downloader: downloader)

      expect(Itms::PlannedProposalCall.first).to have_attributes(
        itms_id: 2,
        itms_href: '/v2/vyzvy/planovane/2',
        itms_created_at: DateTime.parse('2015-05-27T10:17:40.163Z'),
        itms_updated_at: DateTime.parse('2016-10-26T19:41:26.605Z'),


        alokacia_eu: 100000000,
        alokacia_sr: 7447059,
        datum_uzavretia_1_kolo: DateTime.parse('2018-01-01T00:00:00Z'),
        datum_uzavretia_2_kolo: DateTime.parse('2018-05-01T00:00:00Z'),
        datum_vyhlasenia_1_kolo: DateTime.parse('2017-11-01T00:00:00Z'),
        datum_vyhlasenia_2_kolo: DateTime.parse('2018-02-01T00:00:00Z'),
        doplnujuce_info: [
            Itms::PlannedProposalCallAdditionalInfo.find_by!(
                nazov: 'Webová stránka Operačného programu Kvalita životného prostredia',
                url: 'http://www.op-kzp.sk'
            ),
        ],
        druh: 'VYZVA',
        kod: '2015/00002',
        konkretne_ciele: [
            Itms::SpecificGoal.find_by!(itms_id: 38)
        ],
        nazov: 'výzva na predkladanie žiadostí o NFP - príprava na opätovné použitie a zhodnocovanie nie nebezpečného odpadu, triedený zber a predchádzanie vzniku BRKO – schéma regionálnej štátnej pomoci',
        poskytovatelia: [
            Itms::Subject.find_by!(itms_id: 100002),
        ],
        stav: 'Vyhlásená výzva',
        typ_1_kolo: 'UZAVRETA',
        typ_2_kolo: 'UZAVRETA',
        vyhlasovatel: Itms::Subject.find_by!(itms_id: 100002)
      )
    end
  end
end
