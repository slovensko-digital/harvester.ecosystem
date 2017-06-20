require 'rails_helper'

RSpec.describe Itms::OngoingProjectsHarvester, type: :service do

  context '#run' do
    it 'loads and imports all ongoing projects' do
      project_file = File.read(fixture_filepath('fixtures/files/projekty.json'))
      goal_file = File.read(fixture_filepath('fixtures/files/konkretny_ciel.json'))
      unit_content = File.read(fixture_filepath('fixtures/files/subjekt.json'))
      axis_content = File.read(fixture_filepath('fixtures/files/prioritna_os.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/projekty/vrealizacii?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: project_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/projekty/vrealizacii?minId=6058429222335320000&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/prioritnaOs/1')
        .and_return(double('response', response_code: 200, body: axis_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/konkretnyCiel/1')
        .and_return(double('response', response_code: 200, body: goal_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/subjekty/1')
        .and_return(double('response', response_code: 200, body: unit_content)).at_least(:once)
      expect {
        expect {
          described_class.run(min_id: 0, downloader: downloader)
        }.to change(Itms::SpecificGoal, :count).by(1)
      }.to change(Itms::OngoingProject, :count).by(1)

      ongoing_project = Itms::OngoingProject.first
      expect(ongoing_project).to have_attributes(
        itms_identifier: 6058429222335320000,
        akronym: 'Odit ipsum dignissimos ullam natus.',
        cislo_zmluvy: 'Libero aut est.',
        created_at: DateTime.parse('2012-07-25T01:31:49+02:00'),
        datum_konca_hlavnych_aktivit: DateTime.parse('1986-09-22T12:45:34+02:00'),
        datum_konca_realizacie: DateTime.parse('1979-04-12T15:22:53+02:00'),
        datum_platnosti_zmluvy: DateTime.parse('2014-06-06T06:54:12+02:00'),
        datum_ucinnosti_zmluvy: DateTime.parse('1973-04-28T12:09:56+01:00'),
        datum_zaciatku_hlavnych_aktivit: DateTime.parse('1990-01-25T06:28:58+01:00'),
        datum_zaciatku_realizacie: DateTime.parse('1996-04-02T01:37:47+02:00'),
        dlzka_celkova_hlavnych_aktivit: 2769115797179209700,
        dlzka_celkova_projektu: 1645046648158204200,
        kod: 'Ea pariatur odio eum tempora eos.',
        nazov: 'Sint quis eum odit.',
        popis_projektu: 'Doloremque eius voluptatem.',
        stav: 'Quia est assumenda in nihil.',
        suma_celkova_projektov_generujucich_prijem: 0.873015176412746,
        suma_zazmluvnena: 0.737401123818093,
        suma_zazmluvnena_povodna: 0.158919588155827,
        updated_at: DateTime.parse('1991-05-03T12:09:44+02:00'),
        zameranie_projektu: 'Molestiae delectus sequi cumque.'
      )
      expect(ongoing_project.ongoing_project_activities.first).to have_attributes(
        datum_konca_planovany: 'Qui fugiat minima.',
        datum_konca_skutocny: 'Ratione eum commodi et qui recusandae ut.',
        datum_zaciatku_planovany: 'Et consequuntur qui.',
        datum_zaciatku_skutocny: 'Aut sequi repellat.',
        kod: 'Laboriosam et molestiae expedita aut omnis quo.',
        nazov: 'Id aut laboriosam doloremque reiciendis non molestiae.'
      )
      expect(ongoing_project.ongoing_project_activities.first.ongoing_project_activity_unit).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico: 'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )
      expect(ongoing_project.ongoing_project_financing_forms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(ongoing_project.ongoing_project_financing_forms.first.ongoing_project_financing_form_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(ongoing_project.ongoing_project_economic_activities.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(ongoing_project.ongoing_project_economic_activities.first.ongoing_project_economic_activity_goal).to have_attributes(
        itms_identifier: 2139854021380057001
      )
      expect(ongoing_project.ongoing_project_intensities.first).to have_attributes(
        itms_identifier: 5158007136973555000,
        nazov: 'Voluptatem ipsa voluptate.'
      )
      expect(ongoing_project.ongoing_project_intensities.first.ongoing_project_intensity_unit).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico: 'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )
      expect(ongoing_project.ongoing_project_intensities.first.ongoing_project_intensity_sources.first).to have_attributes(
        typ: 'zdrojEu',
        cerpanie_eu: 0.511635391885131,
        cerpanie_ro: 0.956036645249362,
        itms_identifier: 6159195892705758000,
        kod: 'Possimus vero fugiat maxime rerum.',
        nazov: 'Maxime impedit voluptatem.',
        percento: 0.621589005947341,
        suma_zazmluvnena: 0.654252587602473
      )
      expect(ongoing_project.ongoing_project_measurable_indicators.first).to have_attributes(
        aktualny_skutocny_stav: 0.2271392384636680,
        hodnota_cielova_celkova: 0.408385312885447,
        kod: 'Odit nemo dolores magnam voluptatibus praesentium.',
        merna_jednotka: 'Animi neque.',
        nazov: 'Ea nesciunt non voluptas quia et dolor.'
      )
      expect(ongoing_project.ongoing_project_realization_places.first.ongoing_project_realization_place_units.first).to have_attributes(
        typ: 'nuts3',
        itms_identifier: 9214145182608512000,
        nazov: 'Aut officiis est eaque quos.'
      )
      expect(ongoing_project.ongoing_project_monitoring_dates.first).to have_attributes(
        datum_predlozenia_najneskorsi: 'Sed nemo dicta.',
        poradove_cislo: 7607536878905254000,
        termin_monitorovania: 'Maxime est nisi nam.',
        typ_monitorovacej_spravy: 'Minima et.'
      )
      expect(ongoing_project.ongoing_project_intervention_areas.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(ongoing_project.ongoing_project_intervention_areas.first.ongoing_project_intervention_area_goal).to have_attributes(
        itms_identifier: 2139854021380057002
      )
      expect(ongoing_project.ongoing_project_organizational_components.first).to have_attributes(
        adresa: 'Temporibus repudiandae nobis et vel in.',
        itms_identifier: 4750311352290475000,
        nazov: 'Unde itaque sunt eius voluptas aut.'
      )
      expect(ongoing_project.ongoing_project_partners.first).to have_attributes(
        ico: 'Atque error ad perferendis soluta autem.',
        itms_identifier: 3604616086874745000,
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )
      expect(ongoing_project.ongoing_project_recipient).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico: '123123123',
        ine_identifikacne_cislo: 'ine_123123123_cislo'
      )
      expect(ongoing_project.ongoing_project_territory_types.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(ongoing_project.ongoing_project_territory_types.first.ongoing_project_territory_type_goal).to have_attributes(
        itms_identifier: 2139854021380057004
      )
      expect(ongoing_project.ongoing_project_territorial_mechanisms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(ongoing_project.ongoing_project_territorial_mechanisms.first.ongoing_project_territorial_mechanism_goal).to have_attributes(
        itms_identifier: 2139854021380057005
      )
      expect(ongoing_project.ongoing_project_appeal).to have_attributes(
        itms_identifier: 2243461805531313200
      )
      # project has been already stored, service should not fail
      expect {
        expect {
          described_class.run(min_id: 0, downloader: downloader)
        }.to change(Itms::SpecificGoal, :count).by(0)
      }.to change(Itms::OngoingProject, :count).by(0)
    end
  end
end
