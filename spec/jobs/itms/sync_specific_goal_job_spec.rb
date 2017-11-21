require 'rails_helper'

RSpec.describe Itms::SyncSpecificGoalJob, type: :job do
  include_context "itms_downloader"

  context '#perform' do
    it 'syncs specific goal and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/konkretnyCiel/33')
          .and_return(double(body: itms_file_fixture('konkretny_ciel_item.json')))

      subject.perform('/v2/konkretnyCiel/33', downloader: downloader)

      expect(Itms::SpecificGoal.first).to have_attributes(
        itms_id: 33,
        itms_href: '/v2/konkretnyCiel/33',
        itms_created_at: DateTime.parse('2016-12-14T18:31:24.067Z'),
        itms_updated_at: nil,

        fond: Itms::CodelistValue.where_codelist_and_value(1032, 3).first!,
        kategoria_regionov: 'menej rozvinuté regióny',
        kod: '310010020',
        nazov: '1.2.1 Zlepšenie odvádzania a čistenia komunálnych odpadových vôd v aglomeráciách nad 2 000 EO v zmysle záväzkov SR voči EÚ',
        technicka_asistencia: false,
      )
    end

    pending 'syncs other attributes' do
      expect(Itms::SpecificGoal.first).to respond_to(
        :prioritna_os,
        :typy_aktivit,
      )
    end
  end
end
