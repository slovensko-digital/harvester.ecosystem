require 'rails_helper'

RSpec.describe Itms::SyncPriorityAxisJob, type: :job do
  include_context "itms_downloader"

  describe '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/prioritnaOs/33')
          .and_return(itms_json_fixture('prioritna_os_item.json'))

      subject.perform('/v2/prioritnaOs/33', downloader: downloader)

      expect(Itms::PriorityAxis.first).to have_attributes(
        itms_id: 33,
        itms_href: '/v2/prioritnaOs/33',
        itms_created_at: DateTime.parse('2017-02-23T18:09:03.502Z'),
        itms_updated_at: nil,

        celkova_financna_alokacia: 84341765,
        hlavna_alokacia: 84341765,
        kod: '313050',
        nazov: '5 Technická pomoc',
        operacny_program: Itms::OperationalProgram.find_by!(itms_id: 4),
        vykonnostna_rezerva: 0,
      )
    end
  end
end
