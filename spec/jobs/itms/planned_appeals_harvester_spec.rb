require 'rails_helper'

RSpec.describe Itms::PlannedAppealsHarvester, type: :service do

  context '#run' do
    it 'loads and imports all planned appeals' do
      appeals_list_content = File.read(fixture_filepath('fixtures/files/vyzvy_planovane_list.json'))
      appeals_item_content = File.read(fixture_filepath('fixtures/files/vyzvy_planovane_item.json'))
      goal_file = File.read(fixture_filepath('fixtures/files/konkretny_ciel.json'))
      axis_content = File.read(fixture_filepath('fixtures/files/prioritna_os.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/vyzvy/planovane?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: appeals_list_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/vyzvy/planovane/4362122098381105000')
        .and_return(double('response', response_code: 200, body: appeals_item_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/vyzvy/planovane?minId=4362122098381105000&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/konkretnyCiel/1')
        .and_return(double('response', response_code: 200, body: goal_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/prioritnaOs/1')
        .and_return(double('response', response_code: 200, body: axis_content)).at_least(:once)
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::PlannedAppeal, :count).by(1)

      appeal = Itms::PlannedAppeal.first
      expect(appeal).to have_attributes(
        itms_identifier: 4362122098381105000,
        alokacia_eu: 0.913376840284702,
        alokacia_sr: 0.79178290458085,
        created_at: DateTime.parse('2005-11-06T13:12:58+01:00'),
        typ1_kolo: 'Et omnis mollitia amet nostrum et aliquam.',
        typ2_kolo: 'Mollitia et at.',
        datum_uzavretia1_kolo: DateTime.parse('1992-06-14T14:14:50+02:00'),
        datum_uzavretia2_kolo: DateTime.parse('1997-12-23T10:33:06+01:00'),
        datum_vyhlasenia1_kolo: DateTime.parse('2011-07-26T19:38:40+02:00'),
        datum_vyhlasenia2_kolo: DateTime.parse('1990-04-27T03:44:19+02:00'),
        druh: 'Rerum voluptatem sed.',
        kod: 'Quia accusantium eveniet tempora ab.',
        nazov: 'Aspernatur impedit veritatis tempore nam qui dolores.',
        stav: 'Omnis qui odio molestiae sequi maxime.',
        updated_at: DateTime.parse('1986-11-25T13:12:19+01:00')
      )
      expect(appeal.planned_appeal_info.first).to have_attributes(
        nazov: 'Assumenda maxime error et.',
        url: 'Delectus magnam harum ipsam voluptatem.'
      )
      expect(appeal.planned_appeal_providers.first).to have_attributes(
        itms_identifier: 3604616086874745000,
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.',
        ico: 'Atque error ad perferendis soluta autem.'
      )
      expect(appeal.planned_appeal_announcer).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico:  'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )

      # appeal has been already stored, service should not fail
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::PlannedAppeal, :count).by(0)
    end
  end
end
