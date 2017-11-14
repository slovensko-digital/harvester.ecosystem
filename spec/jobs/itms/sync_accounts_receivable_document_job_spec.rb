require 'rails_helper'

RSpec.describe Itms::SyncAccountsReceivableDocumentJob, type: :job do
  include_context "itms_downloader"

  context '#perform' do
    it 'syncs accounts receivable document and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/pohladavkovyDoklad/2')
          .and_return(double(body: itms_file_fixture('pohladavkovy_doklad_item.json')))

      subject.perform(2, downloader: downloader)

      expect(Itms::AccountsReceivableDocument.first).to have_attributes(
        itms_id: 2,
        itms_href: '/v2/pohladavkovyDoklad/2',
        itms_created_at: DateTime.parse('2016-10-17T15:37:16.521Z'),
        itms_updated_at: DateTime.parse('2016-11-11T00:00:00Z'),

        datum_splatnosti: DateTime.parse('2017-01-16T00:00:00Z'),
        datum_vzniku: DateTime.parse('2016-11-11T00:00:00Z'),
        dlznik: Itms::Subject.find_by!(itms_id: 100140),
        dopad_na_rozpocet_eu: 'S_DOPADOM_NA_ROZPOCET_EU',
        dovod_vratenia: Itms::CodelistValue.where_codelist_and_value(1082, 7).first!,
        druh: 'PD_K_PROJEKTU',
        kod: '312041A136Z001',
        konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 8),
        nezrovnalost: Itms::Discrepancy.find_by!(itms_id: 4),
        prioritna_os: Itms::PriorityAxis.find_by!(itms_id: 8),
        stav: 'Vysporiadaný',
        subjekt_zodpovedny_za_vymahanie: Itms::Subject.find_by!(itms_id: 100003),
        suma_na_vratenie: 773.79,
        suma_na_vratenie_zdroj_eu: 657.72,
        suma_na_vratenie_zdroj_pr: nil,
        suma_na_vratenie_zdroj_sr: 116.07,
        typ: 'ZOVFP',
        vracia_sa_do_rozpoctu_projektu: false,
        vratena_suma: 773.79,
        vratena_suma_zdroj_eu: 657.72,
        vratena_suma_zdroj_pr: nil,
        vratena_suma_zdroj_sr: 116.07,
      )
    end

    pending 'syncs second-level and 1-to-M attributes' do
      expect(Itms::AccountsReceivableDocument.first).to respond_to(
        :projekt,
        :suvisiace_verejne_obstaravania,
        :suvisiace_zop
      )
    end
  end
end
