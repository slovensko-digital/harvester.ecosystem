require 'rails_helper'

RSpec.describe Itms::SyncCodelistValueJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs values of a given codelist' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/hodnotaCiselnika/1001/hodnota/1')
          .and_return(double(body: itms_file_fixture('hodnota_ciselnika_item.json')))
          .once

      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/ciselniky')
          .and_return(double(body: itms_file_fixture('ciselniky_list.json')))
          .once

      subject.perform(1001, 1, downloader: downloader)

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
