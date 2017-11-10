require 'rails_helper'

RSpec.describe Itms::SyncIntensityJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs intensity and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/intenzita/1'))
          .and_return(double(body: itms_file_fixture('intenzita_item.json')))
          .at_least(:once)

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/subjekty/'))
          .and_return(double(body: itms_file_fixture('subjekt_item.json')))

      allow(downloader)
          .to receive(:get)
          .with(include('https://opendata.itms2014.sk/v2/hodnotaCiselnika/'))
          .and_return(double(body: itms_file_fixture('hodnota_ciselnika_item.json')))

      allow(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/ciselniky')
          .and_return(double(body: itms_file_fixture('ciselniky_list.json')))

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
  end
end
