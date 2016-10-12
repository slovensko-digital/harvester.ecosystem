require 'rails_helper'

RSpec.describe Ra::FetchChangesBatchJob, type: :job do
  describe '#perform' do
    let(:downloader) { double }

    it 'fetches and imports changes from batch' do
      expect(downloader).to receive(:download_file).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka5362764.xml').
        and_return(fixture_filepath('jobs/ra/fixtures/zmenovadavka5362764.xml'))

      subject.perform('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka5362764.xml', downloader: downloader)

      property_change = Ra::PropertyRegistrationNumberChange.first
      expect(property_change).to have_attributes(
        id: 60195291,
        changed_at: Time.parse('2016-06-03T14:17:33.723'),
        database_operation: 'INSERT',
        property_registration_number_id: 585020,
        version_id: 5245180,
        created_reason: 'CORRECT',
        valid_from: Time.parse('2016-06-03T14:17:33.65'),
        valid_to: Time.parse('3000-12-31T23:59:59.0'),
        effective_on: Date.parse('1000-01-01'),
        property_registration_number: 39,
        building_contains_flats: true,
        building_type_id: 10,
        municipality_id: 2889,
        district_id: 4697
      )

      expect(property_change.building_purpose).to have_attributes(
        code: 'residentialBuilding',
        name: 'Bytová budova',
      )

      expect(property_change.building_type).to have_attributes(
        id: 10,
        name: 'Rodinný dom',
      )

      building_number_change = Ra::BuildingNumberChange.first
      expect(building_number_change).to have_attributes(
        id: 60195314,
        changed_at: Time.parse('2016-06-03T14:17:33.877'),
        database_operation: 'UPDATE',
        building_number_id: 2125309,
        version_id: 5207552,
        created_reason: 'IMPORT',
        valid_from: Time.parse('1000-01-01T00:00:00.0'),
        valid_to: Time.parse('2016-06-03T14:17:33.65'),
        effective_on: Date.parse('1000-01-01'),
        building_index: '1745974A',
        postal_code: 7214,
        property_registration_number_id: 585020,
      )

      expect(building_number_change.address_point).to have_attributes(
        x: 22.0915186708749,
        y: 48.6263081034578
      )


      building_unit_change = Ra::BuildingUnitChange.first
      expect(building_unit_change).to have_attributes(
        id: 60196464,
        building_unit_id: 4005683,
        building_number_id: 2734787,
        changed_at: Time.parse('2016-06-03T14:18:13.279'),
        database_operation: 'INSERT',
        version_id: 3087790,
        created_reason: 'CREATE',
        valid_from: Time.parse('2016-06-03T14:18:13.222'),
        valid_to: Time.parse('3000-12-31T23:59:59.0'),
        effective_on: Date.parse('2016-06-03'),
        building_unit_floor: '1',
        building_unit_number: '17',
        building_unit_label: 'byt',
      )

      expect(Ra::ChangesBatch.first).to have_attributes(
        id: 5362764,
        generated_at: Time.parse('2016-10-06T02:35:21.615'), # TODO time zone
      )
    end

    it 'can parse street name changes' do
      expect(downloader).to receive(:download_file).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka1952939.xml').
        and_return(fixture_filepath('jobs/ra/fixtures/zmenovadavka1952939.xml'))

      subject.perform('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka1952939.xml', downloader: downloader)

      expect(Ra::StreetNameChange.first).to have_attributes(
        id: 19764348,
        street_name_id: 39693,
        changed_at: Time.parse('2016-04-14T11:35:51.872'),
        database_operation: 'UPDATE',
        version_id: 3034621,
        created_reason: 'IMPORT',
        valid_from: Time.parse('1981-01-26T00:00:00.0'),
        valid_to: Time.parse('2016-04-14T11:35:51.821'),
        effective_on: Date.parse('1981-01-26'),
        street_name: 'Juraja Hronca',
        municipality_id: 3000
      )
    end

    pending 'it adds batch record last'

  end
end
