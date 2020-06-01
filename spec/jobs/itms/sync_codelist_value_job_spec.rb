require 'rails_helper'

RSpec.describe Itms::SyncCodelistValueJob, type: :job do
  include_context 'itms_downloader'

  describe '#perform' do
    it 'syncs values of a given codelist' do
      expect(downloader)
        .to receive(:get_json_from_href)
        .with('/v2/hodnotaCiselnika/1001/hodnota/1')
        .and_return(itms_json_fixture('hodnota_ciselnika_item.json'))
        .once

      expect(downloader)
        .to receive(:get_json_from_href)
        .with('/v2/ciselniky')
        .and_return(itms_json_fixture('ciselniky_list.json'))
        .once

      subject.perform('/v2/hodnotaCiselnika/1001/hodnota/1', downloader: downloader)

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

    context 'with codelist value URL not found' do
      before(:example) do
        allow(downloader).to receive(:href_exists?).and_return(false)
        expect(downloader).not_to receive(:get_json_from_href)
      end

      it 'marks codelist value as deleted if exists' do
        codelist_value = create(:itms_codelist_value)

        expect { subject.perform('/v2/hodnotaCiselnika/1006/hodnota/1', downloader: downloader) }.to change { codelist_value.reload.deleted_at }.from(nil).to(kind_of(Time))
      end

      it 'does not create codelist value if does not exist' do
        expect(Itms::CodelistValue.count).to eq(0)

        expect { subject.perform('/v2/hodnotaCiselnika/1006/hodnota/1', downloader: downloader) }.not_to change { Itms::CodelistValue.count }
      end
    end
  end
end
