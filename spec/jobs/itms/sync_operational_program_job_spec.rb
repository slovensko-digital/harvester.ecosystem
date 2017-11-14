require 'rails_helper'

RSpec.describe Itms::SyncOperationalProgramJob, type: :job do
  include_context "itms_downloader"

  context '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/operacneProgramy/1')
          .and_return(double(body: itms_file_fixture('operacny_program_item.json')))

      subject.perform(1, downloader: downloader)

      expect(Itms::OperationalProgram.first).to have_attributes(
        itms_id: 1,
        itms_href: '/v2/operacneProgramy/1',
        itms_created_at: DateTime.parse('2017-10-09T10:31:02.622Z'),
        itms_updated_at: DateTime.parse('2017-10-09T10:31:03.057Z'),

        celkova_financna_alokacia: 4327609993,
        hlavna_alokacia: 4327609993,
        kod: '310000/7',
        kod_cci: '2014SK16M1OP002',
        nazov: 'Operačný program Kvalita životného prostredia',
        skratka: 'OP KZP',
        subjekt: Itms::Subject.find_by!(itms_id: 100002),
        vykonnostna_rezerva: 0,
      )
    end
  end
end
