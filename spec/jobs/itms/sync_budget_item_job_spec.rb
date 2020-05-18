require 'rails_helper'

RSpec.describe Itms::SyncBudgetItemJob, type: :job do
  include_context 'itms_downloader'

  describe '#perform' do
    it 'syncs budget item and all of its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/polozkaRozpoctu/1')
          .and_return(itms_json_fixture('polozka_rozpoctu_item.json'))
          .once

      subject.perform('/v2/polozkaRozpoctu/1', downloader: downloader)

      expect(Itms::BudgetItem.first).to have_attributes(
        itms_id: 1,
        itms_href: '/v2/polozkaRozpoctu/1',

        aktivita: Itms::Activity.find_by!(itms_id: 1),
        intenzita: Itms::Intensity.find_by!(itms_id: 1),
        skupina_vydavkov: Itms::CodelistValue.where_codelist_and_value(1040, 10).first!,
        subjekt: Itms::Subject.find_by!(itms_id: 100077),
        viazana_suma: 7002729.1,
        volne_prostriedky: 25278444.49,
        vratena_suma: 0,
        zazmluvnena_suma: 32281173.59,
      )
    end

    context 'with budget item URL not found' do
      before(:example) do
        allow(downloader).to receive(:href_exists?).and_return(false)
        expect(downloader).not_to receive(:get_json_from_href)
      end

      it 'marks budget item as deleted if it exists' do
        budget_item = create(:itms_budget_item)

        expect { subject.perform('/v2/polozkaRozpoctu/1', downloader: downloader) }.to change { budget_item.reload.deleted_at }.from(nil).to(kind_of(Time))
      end

      it 'does not create budget item if it does not exist' do
        expect(Itms::BudgetItem.count).to eq(0)

        expect { subject.perform('/v2/polozkaRozpoctu/1', downloader: downloader) }.not_to change { Itms::BudgetItem.count }
      end
    end
  end
end
