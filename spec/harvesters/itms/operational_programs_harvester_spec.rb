require 'rails_helper'

RSpec.describe Itms::OperationalProgramsHarvester, type: :service do

  context '#run' do
    it 'loads and imports all operational programs' do
      programs_content = File.read(fixture_filepath('fixtures/files/operacne_programy.json'))
      axes_content = File.read(fixture_filepath('fixtures/files/prioritne_osi.json'))
      unit_content = File.read(fixture_filepath('fixtures/files/subjekt.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/operacneProgramy?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: programs_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/operacneProgramy?minId=99&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/operacneProgramy/99/prioritneOsi')
        .and_return(double('response', response_code: 200, body: axes_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/subjekty/1')
        .and_return(double('response', response_code: 200, body: unit_content)).at_least(:once)
      expect {
        expect {
          expect {
            expect {
              described_class.run(min_id: 0, downloader: downloader)
            }.to change(Itms::PriorityAxis, :count).by(1)
          }.to change(Itms::Unit, :count).by(1)
        }.to change(Itms::OperationalProgramUnit, :count).by(1)
      }.to change(Itms::OperationalProgram, :count).by(1)

      program = Itms::OperationalProgram.first
      expect(program).to have_attributes(
        itms_identifier: 99,
        created_at: DateTime.parse('1979-11-29T08:14:13+01:00'),
        kod: 'Nemo et.',
        kod_cci: 'Odio odio.',
        nazov: 'Sequi in sed magni sequi inventore ullam.',
        skratka: 'Pariatur officia maiores.',
        updated_at: DateTime.parse('1986-10-27T17:40:00+01:00'),
      )
      expect(program.operational_program_unit).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico: 'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )

      # program has been already stored, service should not fail
      expect {
        expect {
          expect {
            expect {
              described_class.run(min_id: 0, downloader: downloader)
            }.to change(Itms::PriorityAxis, :count).by(0)
          }.to change(Itms::Unit, :count).by(0)
        }.to change(Itms::OperationalProgramUnit, :count).by(0)
      }.to change(Itms::OperationalProgram, :count).by(0)
    end
  end
end
