require 'rails_helper'

RSpec.describe Itms::RejectedZonfpHarvester, type: :service do

  context '#run' do
    it 'loads and imports all rejected zonfp' do
      zonfp_content = File.read(fixture_filepath('fixtures/files/zonfp_zamietnute.json'))
      unit_content = File.read(fixture_filepath('fixtures/files/subjekt.json'))
      goal_file = File.read(fixture_filepath('fixtures/files/konkretny_ciel.json'))
      axis_content = File.read(fixture_filepath('fixtures/files/prioritna_os.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/zonfp/zamietnute?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: zonfp_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/zonfp/zamietnute?minId=4549911737367425500&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/subjekty/1')
        .and_return(double('response', response_code: 200, body: unit_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/konkretnyCiel/1')
        .and_return(double('response', response_code: 200, body: goal_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/prioritnaOs/1')
        .and_return(double('response', response_code: 200, body: axis_content)).at_least(:once)
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::RejectedZonfp, :count).by(1)

      zonfp = Itms::RejectedZonfp.first
      expect(zonfp).to have_attributes(
        itms_identifier: 4549911737367425500,
        akronym: 'Voluptatem autem.',
        created_at: DateTime.parse('1985-11-15T13:26:26+01:00'),
        kod: 'Ipsum sed necessitatibus alias accusantium.',
        nazov: 'Provident delectus.',
        popis_projektu: 'Quo facere iusto facilis.',
        updated_at: DateTime.parse('1975-11-05T11:00:38+01:00'),
        zameranie_projektu: 'Sed ut blanditiis expedita aut.',
        datum_zamietnutia: DateTime.parse('1997-03-20T00:26:46+01:00'),
        datum_ziadany_konca_hlavnych_aktivit: DateTime.parse('1974-05-29T18:55:45+01:00'),
        datum_ziadany_konca_realizacie: DateTime.parse('1982-07-26T06:52:53+02:00'),
        datum_ziadany_zaciatku_hlavnych_aktivit: DateTime.parse('1973-10-14T20:59:33+01:00'),
        datum_ziadany_zaciatku_realizacie: DateTime.parse('1970-05-15T10:50:20+01:00'),
        percento_ziadane_spolufinancovania: 0.510663784133778,
        suma_ziadana_celkova: 0.209398587067117,
        suma_ziadana_celkova_projektov_generujucich_prijem: 0.362872003787560,
        suma_ziadana_nfp: 0.739904460722846,
        suma_ziadana_vlastnych_zdrojov: 0.303361743918675
      )
      expect(zonfp.rejected_zonfp_activity_projects.first).to have_attributes(
        datum_konca_planovany: 'Qui fugiat minima.',
        datum_konca_skutocny: 'Ratione eum commodi et qui recusandae ut.',
        datum_zaciatku_planovany: 'Et consequuntur qui.',
        datum_zaciatku_skutocny: 'Aut sequi repellat.',
        kod: 'Laboriosam et molestiae expedita aut omnis quo.',
        nazov: 'Id aut laboriosam doloremque reiciendis non molestiae.'
      )
      expect(zonfp.rejected_zonfp_activity_projects.first.rejected_zonfp_activity_project_unit).to have_attributes(
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        itms_identifier: 1264743098737356000,
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.'
      )
      expect(zonfp.rejected_zonfp_financing_forms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.rejected_zonfp_financing_forms.first.rejected_zonfp_financing_form_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.rejected_zonfp_economic_activities.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.rejected_zonfp_economic_activities.first.rejected_zonfp_economic_activity_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.rejected_zonfp_measurable_indicators.first).to have_attributes(
        aktualny_skutocny_stav: 0.408385312885447,
        hodnota_cielova_celkova: 0.263568894293654,
        kod: 'Nemo dolores magnam voluptatibus praesentium molestias animi.',
        merna_jednotka: 'Voluptatem ea nesciunt non voluptas quia.',
        nazov: 'Dolor ipsum harum sit aut officiis.'
      )
      expect(zonfp.rejected_zonfp_realization_places.first.rejected_zonfp_realization_place_units.first).to have_attributes(
        typ: 'nuts3',
        itms_identifier: 5181764159482812000,
        nazov: 'Excepturi non placeat quos sit quia aut.'
      )
      expect(zonfp.rejected_zonfp_intervention_areas.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.rejected_zonfp_intervention_areas.first.rejected_zonfp_intervention_area_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.rejected_zonfp_organizational_components.first).to have_attributes(
        itms_identifier: 5386523305359476000,
        adresa: 'Sunt eius voluptas aut.',
        nazov: 'Quam voluptate.'
      )
      expect(zonfp.rejected_zonfp_partners.first).to have_attributes(
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        itms_identifier: 1264743098737356000,
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.',
        dic: 'Eligendi id sit.'
      )
      expect(zonfp.rejected_zonfp_territory_types.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.rejected_zonfp_territory_types.first.rejected_zonfp_territory_type_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.rejected_zonfp_territorial_mechanisms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.rejected_zonfp_territorial_mechanisms.first.rejected_zonfp_territorial_mechanism_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.rejected_zonfp_appeal).to have_attributes(
        itms_identifier: 8999066612424642000
      )
      expect(zonfp.rejected_zonfp_applicant).to have_attributes(
        itms_identifier: 1264743098737356000,
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        dic: 'Eligendi id sit.',
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.'
      )

      # zonfp has been already stored, service should not fail
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::RejectedZonfp, :count).by(0)
    end
  end
end
