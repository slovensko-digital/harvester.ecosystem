require 'rails_helper'

RSpec.describe Itms::SyncIntensityJob, type: :job do
  include_context 'itms_downloader'

  describe '#perform' do
    it 'syncs intensity and all of its attributes' do
      expect(downloader)
          .to receive(:get_json_from_href)
          .with('/v2/intenzita/1')
          .and_return(itms_json_fixture('intenzita_item.json'))
          .at_least(:once)

      subject.perform('/v2/intenzita/1', downloader: downloader)

      expect(Itms::Intensity.first).to have_attributes(
        itms_id: 1,
        itms_href: '/v2/intenzita/1',

        nazov: 'Intenzita 312020/7170/LDR/30794536',
        subjekt: Itms::Subject.find_by!(itms_id: 100077),
        zdroj_eu: Itms::IntensitySource.find_by!(
            cerpanie_eu: 2830622.31.to_d,
            cerpanie_ro: 4545240.46.to_d,
            percento: 0.565845.to_d,
            suma_zazmluvnena: 18677128.8375.to_d,
            zdroj: Itms::CodelistValue.where_codelist_and_value(1052, 6),
        ),
        zdroj_pr: Itms::IntensitySource.find_by!(
            cerpanie_eu: 2830622.32.to_d,
            cerpanie_ro: 4545240.46.to_d,
            percento: 0.565845.to_d,
            suma_zazmluvnena: 18677128.8375.to_d,
            zdroj: Itms::CodelistValue.where_codelist_and_value(1052, 6),
        ),
        zdroj_sr: Itms::IntensitySource.find_by!(
            cerpanie_eu: 499521.57.to_d,
            cerpanie_ro: 802101.25.to_d,
            percento: 0.099855.to_d,
            suma_zazmluvnena: 3295963.9125.to_d,
            zdroj: Itms::CodelistValue.where_codelist_and_value(1052, 7),
        ),
        zdroj_vz: Itms::IntensitySource.find_by!(
            cerpanie_eu: 499521.58.to_d,
            cerpanie_ro: 802101.25.to_d,
            percento: 0.099855.to_d,
            suma_zazmluvnena: 3295963.9125.to_d,
            zdroj: Itms::CodelistValue.where_codelist_and_value(1052, 7),
        ),
        zdroj_yei: Itms::IntensitySource.find_by!(
            cerpanie_eu: 1672325.51.to_d,
            cerpanie_ro: 2685318.22.to_d,
            percento: 0.3343.to_d,
            suma_zazmluvnena: 11034407.25.to_d,
            zdroj: Itms::CodelistValue.where_codelist_and_value(1052, 200001),
        ),
      )
    end

    context 'with intensity url not found' do
      before(:example) do
        allow(downloader).to receive(:href_exists?).and_return(false)
        expect(downloader).not_to receive(:get_json_from_href)
      end

      it 'marks intensity as deleted if exists' do
        intensity = create(:itms_intensity)

        expect { subject.perform('/v2/intenzita/1', downloader: downloader) }.to change { intensity.reload.deleted_at }.from(nil).to(kind_of(Time))
      end

      it 'does not create intensity if does not exist' do
        expect(Itms::Intensity.count).to eq(0)

        expect { subject.perform('/v2/intenzita/1', downloader: downloader) }.not_to change { Itms::Intensity.count }
      end
    end
  end
end
