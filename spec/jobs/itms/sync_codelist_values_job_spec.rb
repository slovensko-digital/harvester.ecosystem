require 'rails_helper'

RSpec.describe Itms::SyncCodelistValuesJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs values of a given codelist' do
      expect(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/hodnotaCiselnika/'))
          .and_return(double(body: itms_file_fixture('hodnota_ciselnika_list.json')))
          .once

      Itms::Codelist.create(ciselnik_kod: 1001)

      expect {
        subject.perform(1001, downloader: downloader)
      }.to change{ Itms::CodelistValue.count }.by(37)

      expect(Itms::CodelistValue.first).to have_attributes(
        ciselnik: Itms::Codelist.find_by!(ciselnik_kod: 1001),

        itms_id: 1,
        itms_href: '/v2/hodnotaCiselnika/1001/hodnota/1',
        kod: '10010200',
        kod_zdroj: '0200',
        nazov: 'Všeobecná úverová banka, a.s.',
        platnost_do: DateTime.parse('2093-01-01T00:00:00Z'),
        platnost_od: DateTime.parse('1993-01-01T00:00:00Z'),
        popis: 'Všeobecná úverová banka, a.s.',
      )
    end
  end
end
