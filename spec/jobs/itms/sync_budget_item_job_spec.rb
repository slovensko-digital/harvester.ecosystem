require 'rails_helper'

RSpec.describe Itms::SyncBudgetItemJob, type: :job do
  include_context 'itms_downloader'

  context '#perform' do
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

    it 'destroys the record if its href returns 404' do
      Itms::BudgetItem.create!(itms_id: 1, itms_href: '/v2/polozkaRozpoctu/1')

      expect(downloader)
        .to receive(:get_json_from_href)
        .with('/v2/polozkaRozpoctu/1')
        .and_raise(ItmsJob::Downloader::NotFoundError)

      expect { subject.perform('/v2/polozkaRozpoctu/1', downloader: downloader) }
        .to change { Itms::BudgetItem.count }.by(-1)
    end
  end
end
