require 'rails_helper'

RSpec.describe Itms::ApprovedZonfpHarvester, type: :service do

  context '#run' do
    it 'loads and imports all approved zonfp' do
      zonfp_list_content = File.read(fixture_filepath('fixtures/files/zonfp_schvalene_list.json'))
      zonfp_item_content = File.read(fixture_filepath('fixtures/files/zonfp_schvalene_item.json'))
      unit_content = File.read(fixture_filepath('fixtures/files/subjekt.json'))
      goal_file = File.read(fixture_filepath('fixtures/files/konkretny_ciel.json'))
      axis_content = File.read(fixture_filepath('fixtures/files/prioritna_os.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zonfp/schvalene?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: zonfp_list_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zonfp/schvalene/4187030973569588000')
        .and_return(double('response', response_code: 200, body: zonfp_item_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zonfp/schvalene?minId=4187030973569588000&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/subjekty/1')
        .and_return(double('response', response_code: 200, body: unit_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/konkretnyCiel/1')
        .and_return(double('response', response_code: 200, body: goal_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/prioritnaOs/1')
        .and_return(double('response', response_code: 200, body: axis_content)).at_least(:once)
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::ApprovedZonfp, :count).by(1)

      zonfp = Itms::ApprovedZonfp.first
      expect(zonfp).to have_attributes(
        itms_identifier: 4187030973569588000,
        akronym: 'Enim nihil.',
        created_at: DateTime.parse('1970-06-24T12:43:02+01:00'),
        datum_schvalenia: DateTime.parse('2011-04-23T12:34:08+02:00'),
        datum_schvaleny_konca_hlavnych_aktivit: DateTime.parse('1996-11-17T08:51:46+01:00'),
        datum_schvaleny_konca_realizacie: DateTime.parse('2012-02-25T03:00:10+01:00'),
        datum_schvaleny_zaciatku_realizacie: DateTime.parse('1987-09-25T02:38:10+02:00'),
        kod: 'Sed nam.',
        nazov: 'Enim sit.',
        percento_schvalene_spolufinancovania: 0.607187073094911,
        pocet_bodov_hodnotenia_celkovy: 0.546557701190437,
        popis_projektu: 'Ut sed fugit tempora ea rem est.',
        suma_schvalena_celkova: 0.297151579804849,
        suma_schvalena_celkova_projektov_generujucich_prijem: 0.158873554833069,
        suma_schvalena_nfp: 0.647232885613338,
        updated_at: DateTime.parse('1994-03-05T06:31:21+01:00'),
        zameranie_projektu: 'Dolores dolorem sit.'
      )
      expect(zonfp.approved_zonfp_activity_projects.first).to have_attributes(
        datum_konca_planovany: 'Qui fugiat minima.',
        datum_konca_skutocny: 'Ratione eum commodi et qui recusandae ut.',
        datum_zaciatku_planovany: 'Et consequuntur qui.',
        datum_zaciatku_skutocny: 'Aut sequi repellat.',
        kod: 'Laboriosam et molestiae expedita aut omnis quo.',
        nazov: 'Id aut laboriosam doloremque reiciendis non molestiae.'
      )
      expect(zonfp.approved_zonfp_activity_projects.first.approved_zonfp_activity_project_unit).to have_attributes(
        dic: 'Eligendi id sit.',
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        itms_identifier: 1264743098737356000,
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.'
      )
      expect(zonfp.approved_zonfp_financing_forms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.approved_zonfp_financing_forms.first.approved_zonfp_financing_form_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.approved_zonfp_evaluators.first).to have_attributes(
        itms_identifier: 6248541792933543000,
        email: 'Unde sit.',
        meno: 'Aspernatur reiciendis.',
        meno_uplne: 'Harum voluptatem sit magni dicta.',
        priezvisko: 'Enim autem vitae iste velit nihil ab.',
        telefon: 'Doloribus molestiae voluptatum.'
      )
      expect(zonfp.approved_zonfp_economic_activities.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.approved_zonfp_economic_activities.first.approved_zonfp_economic_activity_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.approved_zonfp_measurable_indicators.first).to have_attributes(
        aktualny_skutocny_stav: 0.408385312885447,
        hodnota_cielova_celkova: 0.263568894293654,
        kod: 'Nemo dolores magnam voluptatibus praesentium molestias animi.',
        merna_jednotka: 'Voluptatem ea nesciunt non voluptas quia.',
        nazov: 'Dolor ipsum harum sit aut officiis.'
      )
      expect(zonfp.approved_zonfp_realization_places.first.approved_zonfp_realization_place_units.first).to have_attributes(
        typ: 'nuts3',
        itms_identifier: 5181764159482812000,
        nazov: 'Excepturi non placeat quos sit quia aut.'
      )
      expect(zonfp.approved_zonfp_intervention_areas.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.approved_zonfp_intervention_areas.first.approved_zonfp_intervention_area_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.approved_zonfp_organizational_components.first).to have_attributes(
        itms_identifier: 5386523305359476000,
        adresa: 'Sunt eius voluptas aut.',
        nazov: 'Quam voluptate.'
      )
      expect(zonfp.approved_zonfp_partners.first).to have_attributes(
        dic: 'Eligendi id sit.',
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.',
        itms_identifier: 1264743098737356000,
        ine_identifikacne_cislo: 'Rerum qui voluptatem harum aut eaque.'
      )
      expect(zonfp.approved_zonfp_territory_types.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.approved_zonfp_territory_types.first.approved_zonfp_territory_type_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.approved_zonfp_territorial_mechanisms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.approved_zonfp_territorial_mechanisms.first.approved_zonfp_territorial_mechanism_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.approved_zonfp_appeal).to have_attributes(
        itms_identifier: 8999066612424642000
      )
      expect(zonfp.approved_zonfp_applicant).to have_attributes(
        dic: 'Eligendi id sit.',
        ico: 'Velit omnis provident aperiam occaecati corrupti quibusdam.'
      )

      # zonfp has been already stored, service should not fail
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::ApprovedZonfp, :count).by(0)
    end
  end
end
