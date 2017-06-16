require 'rails_helper'

RSpec.describe Itms::ReceivedZonfpHarvester, type: :service do

  context '#run' do
    it 'loads and imports all received zonfp' do
      zonfp_content = File.read(fixture_filepath('fixtures/files/zonfp_prijate.json'))
      unit_content = File.read(fixture_filepath('fixtures/files/subjekt.json'))
      goal_file = File.read(fixture_filepath('fixtures/files/konkretny_ciel.json'))
      axis_content = File.read(fixture_filepath('fixtures/files/prioritna_os.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zonfp/prijate?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: zonfp_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/zonfp/prijate?minId=6737247880451281000&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/subjekty/1')
        .and_return(double('response', response_code: 200, body: unit_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/konkretnyCiel/1')
        .and_return(double('response', response_code: 200, body: goal_file)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/prioritnaOs/1')
        .and_return(double('response', response_code: 200, body: axis_content)).at_least(:once)
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::ReceivedZonfp, :count).by(1)

      zonfp = Itms::ReceivedZonfp.first
      expect(zonfp).to have_attributes(
        itms_identifier: 6737247880451281000,
        akronym: 'Incidunt excepturi voluptate eum error id.',
        created_at: DateTime.parse('1988-10-06T02:01:54+01:00'),
        datum_predlozenia: DateTime.parse('1993-07-14T12:51:16+02:00'),
        datum_ziadany_konca_hlavnych_aktivit: DateTime.parse('1994-11-24T01:09:52+01:00'),
        datum_ziadany_konca_realizacie: DateTime.parse('2013-12-10T10:09:12+01:00'),
        datum_ziadany_zaciatku_hlavnych_aktivit: DateTime.parse('1981-02-02T10:04:59+01:00'),
        datum_ziadany_zaciatku_realizacie: DateTime.parse('1990-01-29T14:04:11+01:00'),
        kod: 'Quaerat sapiente occaecati voluptates sint nobis sed.',
        nazov: 'Non placeat quos.',
        percento_ziadane_spolufinancovania: 0.781886525539227,
        popis_projektu: 'Voluptate rerum incidunt ad.',
        suma_ziadana_celkova: 0.106383221619519,
        suma_ziadana_celkova_projektov_generujucich_prijem: 0.687651451260515,
        suma_ziadana_nfp: 0.590132093634562,
        suma_ziadana_vlastnych_zdrojov: 0.291929038061502,
        updated_at: DateTime.parse('1992-04-09T10:35:49+02:00'),
        zameranie_projektu: 'Id voluptatibus qui.'
      )
      expect(zonfp.received_zonfp_activity_projects.first).to have_attributes(
        datum_konca_planovany: 'Qui fugiat minima.',
        datum_konca_skutocny: 'Ratione eum commodi et qui recusandae ut.',
        datum_zaciatku_planovany: 'Et consequuntur qui.',
        datum_zaciatku_skutocny: 'Aut sequi repellat.',
        kod: 'Laboriosam et molestiae expedita aut omnis quo.',
        nazov: 'Id aut laboriosam doloremque reiciendis non molestiae.'
      )
      expect(zonfp.received_zonfp_activity_projects.first.received_zonfp_activity_project_unit).to have_attributes(
        ico: 'Atque error ad perferendis soluta autem.',
        itms_identifier: 3604616086874745000,
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )
      expect(zonfp.received_zonfp_financing_forms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.received_zonfp_financing_forms.first.received_zonfp_financing_form_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.received_zonfp_economic_activities.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.received_zonfp_economic_activities.first.received_zonfp_economic_activity_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.received_zonfp_measurable_indicators.first).to have_attributes(
        aktualny_skutocny_stav: 0.2271392384636680,
        hodnota_cielova_celkova: 0.408385312885447,
        kod: 'Odit nemo dolores magnam voluptatibus praesentium.',
        merna_jednotka: 'Animi neque.',
        nazov: 'Ea nesciunt non voluptas quia et dolor.'
      )
      expect(zonfp.received_zonfp_realization_places.first.received_zonfp_realization_place_units.first).to have_attributes(
        typ: 'nuts3',
        itms_identifier: 9214145182608512000,
        nazov: 'Aut officiis est eaque quos.'
      )
      expect(zonfp.received_zonfp_intervention_areas.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.received_zonfp_intervention_areas.first.received_zonfp_intervention_area_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.received_zonfp_organizational_components.first).to have_attributes(
        itms_identifier: 4750311352290475000,
        adresa: 'Temporibus repudiandae nobis et vel in.',
        nazov: 'Temporibus repudiandae nobis et vel in.'
      )
      expect(zonfp.received_zonfp_partners.first).to have_attributes(
        ico: 'Atque error ad perferendis soluta autem.',
        itms_identifier: 3604616086874745000,
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )
      expect(zonfp.received_zonfp_territory_types.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.received_zonfp_territory_types.first.received_zonfp_territory_type_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.received_zonfp_territorial_mechanisms.first).to have_attributes(
        itms_identifier: 6619364344456191000,
        kod_zdroj: 'Ut ipsum.',
        nazov: 'Dolores quo recusandae blanditiis quaerat dignissimos minima.'
      )
      expect(zonfp.received_zonfp_territorial_mechanisms.first.received_zonfp_territorial_mechanism_goal).to have_attributes(
        itms_identifier: 2139854021380057000
      )
      expect(zonfp.received_zonfp_appeal).to have_attributes(
        itms_identifier: 2243461805531313200
      )
      expect(zonfp.received_zonfp_applicant).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico: 'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )

      # zonfp has been already stored, service should not fail
      expect {
        described_class.run(min_id: 0, downloader: downloader)
      }.to change(Itms::ReceivedZonfp, :count).by(0)
    end
  end
end
