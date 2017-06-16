require 'rails_helper'

RSpec.describe Itms::RejectedZopHarvester, type: :service do

  context '#run' do
    it 'loads and imports all rejected zop' do
      zop_content = File.read(fixture_filepath('fixtures/files/zop_zamietnute.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zop/zamietnute?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: zop_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zop/zamietnute?minId=1404159811923837200&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::RejectedZop, :count).by(1)

      zop = Itms::RejectedZop.first
      expect(zop).to have_attributes(
        itms_identifier: 1404159811923837200,
        created_at: DateTime.parse('1985-11-29T22:46:53+01:00'),
        datum_prijatia: DateTime.parse('2007-09-03T19:47:40+02:00'),
        kod: 'Nobis commodi.',
        narokovana_suma: 0.0650355890148087,
        typ: 'Ipsam molestias nobis.',
        updated_at: DateTime.parse('1977-12-10T11:49:32+01:00'),
        vyplaca_sa_partnerovi: false,
        zop_je_zaverecna: false
      )
      expect(zop.rejected_zop_pre_financing).to have_attributes(
        itms_identifier: 1404159811923837200
      )
      expect(zop.rejected_zop_submitted_for).to have_attributes(
        dic: 'Eligendi id sit.',
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        itms_identifier: 1264743098737356000,
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.'
      )
      expect(zop.rejected_zop_recipient).to have_attributes(
        dic: 'Eligendi id sit.',
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        itms_identifier: 1264743098737356000,
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.'
      )
      expect(zop.rejected_zop_project).to have_attributes(
        itms_identifier: 8800877751400878000
      )

      # zop has been already stored, service should not fail
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::RejectedZop, :count).by(0)
    end
  end
end
