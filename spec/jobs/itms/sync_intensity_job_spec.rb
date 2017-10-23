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

      subject.perform('/v2/intenzita/1', downloader: downloader)

      expect(Itms::Intensity.first).to have_attributes(
        itms_id: 1,
        itms_href: '/v2/intenzita/1',

        nazov: 'Intenzita 312020/7170/LDR/30794536',
        subjekt: Itms::Subject.find_by!(itms_id: 100077),
        zdroj_eu: Itms::IntensitySource.find_by!(
            cerpanie_eu: 2494121.91.to_d,
            cerpanie_ro: 4296101.17.to_d,
            zdroj_id: 6,
            kod: '1AC1',
            nazov: 'Európsky sociálny fond – prostriedky EÚ',
            percento: 0.565845.to_d,
            suma_zazmluvnena: 18677128.8375.to_d
        ),
        zdroj_pr: Itms::IntensitySource.find_by!(
            cerpanie_eu: 7642.8.to_d,
            cerpanie_ro: 7642.8.to_d,
            zdroj_id: 3,
            kod: '1AA3',
            nazov: 'EurĂłpsky fond regionĂˇlneho rozvoja â€“ pro rata',
            percento: 0.0345.to_d,
            suma_zazmluvnena: 24020.97.to_d
        ),
        zdroj_sr: Itms::IntensitySource.find_by!(
            cerpanie_eu: 440139.14.to_d,
            cerpanie_ro: 758135.49.to_d,
            zdroj_id: 7,
            kod: '1AC2',
            nazov: 'Európsky sociálny fond – spolufinancovanie ŠR',
            percento: 0.099855.to_d,
            suma_zazmluvnena: 3295963.9125.to_d
        ),
        zdroj_vz: Itms::IntensitySource.find_by!(
            cerpanie_eu: nil,
            cerpanie_ro: 64497.05.to_d,
            zdroj_id: 17,
            kod: '9020',
            nazov: 'VlastnĂ© verejnĂ©',
            percento: 0.05.to_d,
            suma_zazmluvnena: 68618.5.to_d
        ),
        zdroj_yei: Itms::IntensitySource.find_by!(
            cerpanie_eu: 1473521.81.to_d,
            cerpanie_ro: 2538127.27.to_d,
            zdroj_id: 200001,
            kod: '1AL1',
            nazov: 'Iniciatíva na podporu zamestnanosti mladých ľudí',
            percento: 0.3343.to_d,
            suma_zazmluvnena: 11034407.25.to_d
        ),
      )
    end
  end
end
