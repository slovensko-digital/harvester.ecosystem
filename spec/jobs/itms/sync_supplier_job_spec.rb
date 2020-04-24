require 'rails_helper'

RSpec.describe Itms::SyncSupplierJob, type: :job do
  include_context 'itms_downloader'

  describe '#perform' do
    it 'syncs supplier and all of its attributes' do
      expect(downloader)
        .to receive(:get_json_from_href)
          .with('/v2/dodavatelia/229')
          .and_return(itms_json_fixture('dodavatel_item.json'))

      subject.perform('/v2/dodavatelia/229', downloader: downloader)

      expect(Itms::Supplier.first).to have_attributes(
        itms_id: 229,
        itms_href: '/v2/dodavatelia/229',
        itms_created_at: DateTime.parse('2016-11-02T09:19:15.117Z'),
        itms_updated_at: DateTime.parse('2016-11-02T09:19:15.125Z'),

        dic: '2020845057',
        ico: '00151513',
        ine_identifikacne_cislo: '41076659',
        nazov: 'Úrad vlády SR',
        obec: Itms::NutsCode.find_by!(
          gps_lat: 48.148598.to_d,
          gps_lon: 17.107747.to_d,
          hodnota_nuts: Itms::CodelistValue.where_codelist_and_value(1006, 99).first!
        ),
        psc: '81370',
        stat: Itms::CodelistValue.where_codelist_and_value(1012, 210).first!,
        typ_ineho_identifikacneho_cisla: Itms::CodelistValue.where_codelist_and_value(1081, 200003).first!,
        ulica: 'Námestie slobody',
        ulica_cislo: '1',
      )
    end

    context 'with supplier url not found' do
      before(:example) do
        allow(downloader).to receive(:href_exists?).and_return(false)
        expect(downloader).not_to receive(:get_json_from_href)
      end

      it 'marks supplier as deleted if exists' do
        supplier = create(:itms_supplier)

        expect { subject.perform('/v2/dodavatelia/229', downloader: downloader) }.to change { supplier.reload.deleted_at }.from(nil).to(kind_of(Time))
      end

      it 'does not create supplier if does not exist' do
        expect(Itms::Supplier.count).to eq(0)

        expect { subject.perform('/v2/dodavatelia/229', downloader: downloader) }.not_to change { Itms::Supplier.count }
      end
    end
  end
end
