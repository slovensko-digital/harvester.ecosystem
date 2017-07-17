require 'rails_helper'

RSpec.describe Itms::DeclaredAppealsHarvester, type: :service do

  context '#run' do
    it 'loads and imports all planned appeals' do
      appeals_list_content = File.read(fixture_filepath('fixtures/files/vyzvy_vyhlasene_list.json'))
      appeals_item_content = File.read(fixture_filepath('fixtures/files/vyzvy_vyhlasene_item.json'))
      goal_file = File.read(fixture_filepath('fixtures/files/konkretny_ciel.json'))
      axis_content = File.read(fixture_filepath('fixtures/files/prioritna_os.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/vyzvy/vyhlasene?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: appeals_list_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/vyzvy/vyhlasene/5608104377301085000')
        .and_return(double('response', response_code: 200, body: appeals_item_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/vyzvy/vyhlasene?minId=5608104377301085000&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/konkretnyCiel/1')
        .and_return(double('response', response_code: 200, body: goal_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/prioritnaOs/1')
        .and_return(double('response', response_code: 200, body: axis_content)).at_least(:once)
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::DeclaredAppeal, :count).by(1)

      appeal = Itms::DeclaredAppeal.first
      expect(appeal).to have_attributes(
        itms_identifier: 5608104377301085000,
        alokacia_eu: 0.157591350218749,
        alokacia_sr: 0.0150517685007062,
        created_at: DateTime.parse('1973-07-25T22:14:47+01:00'),
        datum_uzavretia: DateTime.parse('1973-12-16T12:43:47+01:00'),
        datum_vyhlasenia: DateTime.parse('1986-03-05T16:56:24+01:00'),
        druh: 'Qui et quidem animi dolore.',
        kod: 'Perspiciatis quibusdam corrupti doloremque qui.',
        nazov: 'Ut alias est distinctio quia.',
        stav: 'Deserunt voluptatem autem.',
        technicka_asistencia: false,
        typ: 'Laborum facere cupiditate.',
        updated_at: DateTime.parse('1973-10-14T20:59:33+01:00')
      )
      expect(appeal.declared_appeal_info.first).to have_attributes(
        nazov: 'Assumenda maxime error et.',
        url: 'Delectus magnam harum ipsam voluptatem.'
      )
      expect(appeal.declared_appeal_funds.first).to have_attributes(
        nazov: 'Eaque sint eligendi.'
      )
      expect(appeal.declared_appeal_goals.first).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(appeal.declared_appeal_contact_persons.first).to have_attributes(
        itms_identifier: 6248541792933543000,
        email: 'Unde sit.',
        meno: 'Aspernatur reiciendis.',
        meno_uplne: 'Harum voluptatem sit magni dicta.',
        priezvisko: 'Enim autem vitae iste velit nihil ab.',
        telefon: 'Doloribus molestiae voluptatum.'
      )
      expect(appeal.declared_appeal_planned_appeals.first).to have_attributes(
        itms_identifier: 4362122098381105000
      )
      expect(appeal.declared_appeal_providers.first).to have_attributes(
        itms_identifier: 3604616086874745000,
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.',
        ico: 'Atque error ad perferendis soluta autem.'
      )
      expect(appeal.declared_appeal_considered_periods.first).to have_attributes(
        datum_uzavierky: 'Vel molestias quaerat qui eos enim deserunt.',
        poradove_cislo: 5880346236508920000
      )
      expect(appeal.declared_appeal_announcer).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico:  'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )

      # appeal has been already stored, service should not fail
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::DeclaredAppeal, :count).by(0)
    end
  end
end
