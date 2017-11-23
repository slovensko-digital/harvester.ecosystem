require 'rails_helper'

RSpec.describe Itms::SyncSpecificGoalJob, type: :job do
  include_context "itms_downloader"

  context '#perform' do
    it 'syncs specific goal and all its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/konkretnyCiel/33')
          .and_return(itms_json_fixture('konkretny_ciel_item.json'))

      subject.perform('/v2/konkretnyCiel/33', downloader: downloader)

      expect(Itms::SpecificGoal.first).to have_attributes(
        itms_id: 33,
        itms_href: '/v2/konkretnyCiel/33',
        itms_created_at: DateTime.parse('2016-12-14T18:31:24.067Z'),
        itms_updated_at: nil,

        fond: Itms::CodelistValue.where_codelist_and_value(1032, 3).first!,
        kategoria_regionov: Itms::CodelistValue.where_codelist_and_value(1033, 1).first!,
        kod: '310010020',
        nazov: '1.2.1 Zlepšenie odvádzania a čistenia komunálnych odpadových vôd v aglomeráciách nad 2 000 EO v zmysle záväzkov SR voči EÚ',
        prioritna_os: Itms::PriorityAxis.find_by!(itms_id: 33),
        technicka_asistencia: false,
        typy_aktivit: [
            Itms::ActivityType.find_by!(itms_id: 217),
            Itms::ActivityType.find_by!(itms_id: 218),
            Itms::ActivityType.find_by!(itms_id: 796),
            Itms::ActivityType.find_by!(itms_id: 1268),
        ]
      )
    end
  end
end
