require 'rails_helper'

RSpec.describe Ra::FetchChangesBatchJob, type: :job do
  def parse_local_time(time_string)
    Time.use_zone('Europe/Bratislava') do
      Time.zone.parse(time_string)
    end
  end

  describe '#perform' do
    let(:downloader) { double }

    it 'fetches and imports changes from batch' do
      expect(downloader).to receive(:download_file).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka5362764.xml').
        and_return(fixture_filepath('jobs/ra/fixtures/zmenovadavka5362764.xml'))

      subject.perform('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka5362764.xml', downloader: downloader)

      property_change = Ra::PropertyRegistrationNumberChange.first
      expect(property_change).to have_attributes(
        change_id: 60195291,
        changed_at: parse_local_time('2016-06-03T14:17:33.723'),
        database_operation: 'INSERT',
        property_registration_number_id: 585020,
        version_id: 5245180,
        created_reason: 'CORRECT',
        valid_from: parse_local_time('2016-06-03T14:17:33.65'),
        valid_to: parse_local_time('3000-12-31T23:59:59.0'),
        effective_on: Date.parse('1000-01-01'),
        property_registration_number: 39,
        building_contains_flats: true,
        municipality_id: 2889,
        district_id: 4697,

        change: Ra::Change.find(60195291),
        property_registration_number_object: Ra::PropertyRegistrationNumber.find(585020),
        municipality: Ra::Municipality.find(2889),
        district: Ra::District.find(4697),
      )

      expect(property_change.building_purpose_code).to have_attributes(
        code: 'residentialBuilding',
        name: 'Bytová budova',
      )

      expect(property_change.building_type_code).to have_attributes(
        code: '10',
        name: 'Rodinný dom',
      )

      building_number_change = Ra::BuildingNumberChange.first
      expect(building_number_change).to have_attributes(
        change_id: 60195314,
        changed_at: parse_local_time('2016-06-03T14:17:33.877'),
        database_operation: 'UPDATE',
        building_number_id: 2125309,
        version_id: 5207552,
        created_reason: 'IMPORT',
        valid_from: parse_local_time('1000-01-01T00:00:00.0'),
        valid_to: parse_local_time('2016-06-03T14:17:33.65'),
        effective_on: Date.parse('1000-01-01'),
        building_index: '1745974A',
        postal_code: 7214,
        property_registration_number_id: 585020,
        street_name_id: nil,

        change: Ra::Change.find(60195314),
        building_number_object: Ra::BuildingNumber.find(2125309),
        property_registration_number: Ra::PropertyRegistrationNumber.find(585020),
      )

      building_number_change_with_street_name = Ra::BuildingNumberChange.find_by!(street_name_id: 59189)
      expect(building_number_change_with_street_name).to have_attributes(
        street_name_id: 59189,
        street_name: Ra::StreetName.find(59189)
      )

      expect(building_number_change.address_point).to have_attributes(
        x: 22.0915186708749,
        y: 48.6263081034578
      )


      building_unit_change = Ra::BuildingUnitChange.first
      expect(building_unit_change).to have_attributes(
        change_id: 60196464,
        building_unit_id: 4005683,
        building_number_id: 2734787,
        changed_at: parse_local_time('2016-06-03T14:18:13.279'),
        database_operation: 'INSERT',
        version_id: 3087790,
        created_reason: 'CREATE',
        valid_from: parse_local_time('2016-06-03T14:18:13.222'),
        valid_to: parse_local_time('3000-12-31T23:59:59.0'),
        effective_on: Date.parse('2016-06-03'),
        building_unit_floor: '1',
        building_unit_number: '17',
        building_unit_label: 'byt',

        change: Ra::Change.find(60196464),
      )

      expect(Ra::ChangesBatch.first).to have_attributes(
        id: 5362764,
        generated_at: parse_local_time('2016-10-06T02:35:21.615'),
      )
    end

    it 'can parse street name changes' do
      expect(downloader).to receive(:download_file).with('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka1952939.xml').
        and_return(fixture_filepath('jobs/ra/fixtures/zmenovadavka1952939.xml'))

      subject.perform('https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/c0cf0bd9-f6e7-4fdd-8d3c-311fa504feab/download/zmenovadavka1952939.xml', downloader: downloader)

      street_name_change = Ra::StreetNameChange.first
      expect(street_name_change).to have_attributes(
        change_id: 19764348,
        street_name_id: 39693,
        changed_at: parse_local_time('2016-04-14T11:35:51.872'),
        database_operation: 'UPDATE',
        version_id: 3034621,
        created_reason: 'IMPORT',
        valid_from: parse_local_time('1981-01-26T00:00:00.0'),
        valid_to: parse_local_time('2016-04-14T11:35:51.821'),
        effective_on: Date.parse('1981-01-26'),
        street_name: 'Juraja Hronca',

        change: Ra::Change.find(19764348),
        municipalities: [Ra::Municipality.find(3000)],
        districts: [],
      )

      expect(street_name_change.street_name_object).to have_attributes(
        id: 39693,
      )
    end

    it 'can parse region changes' do
      expect(downloader).to receive(:download_file).with('abc').
        and_return(fixture_filepath('jobs/ra/fixtures/DavkaInit_20151009-01.xml'))

      subject.perform('abc', downloader: downloader)

      region_change = Ra::RegionChange.first
      expect(region_change).to have_attributes(
        change_id: nil,
        region_id: 1,
        database_operation: 'INSERT',
        version_id: 1,
        created_reason: 'CREATE',
        valid_to: Time.parse('2004-04-30T23:59:59+02:00'),
        effective_on: Date.parse('1996-07-24+02:00'),

        change: nil,
        region_object: Ra::Region.find(1),
      )

      expect(region_change.region_code).to have_attributes(
        code: '0',
        name: 'Neznámy'
      )
    end

    it 'can parse county changes' do
      expect(downloader).to receive(:download_file).with('abc').
        and_return(fixture_filepath('jobs/ra/fixtures/DavkaInit_20151009-02.xml'))

      subject.perform('abc', downloader: downloader)

      county_change = Ra::CountyChange.first
      expect(county_change).to have_attributes(
        change_id: nil,
        county_id: 11,
        region_id: 1,
        database_operation: 'INSERT',
        version_id: 1,
        created_reason: 'CREATE',
        valid_to: Time.parse('2004-04-30T23:59:59+02:00'),
        effective_on: Date.parse('1996-07-24+02:00'),

        change: nil,
        county_object: Ra::County.find(11),
        region: Ra::Region.find(1),
      )

      expect(county_change.county_code).to have_attributes(
        code: '6000',
        name: 'Neznámy'
      )
    end

    it 'can parse municipality changes' do
      expect(downloader).to receive(:download_file).with('abc').
        and_return(fixture_filepath('jobs/ra/fixtures/DavkaInit_20151009-03.xml'))

      subject.perform('abc', downloader: downloader)

      municipality_change = Ra::MunicipalityChange.first
      expect(municipality_change).to have_attributes(
        municipality_id: 92,
        county_id: 11,
        database_operation: 'INSERT',
        version_id: 1,
        created_reason: 'CREATE',
        valid_to: Time.parse('2004-04-30T23:59:59+02:00'),
        municipality_status: 'MUNICIPALITY',

        municipality_object: Ra::Municipality.find(92),
        county: Ra::County.find(11),
      )

      # Attributes we don't have testing data for
      expect(municipality_change).to respond_to(:change_id, :city_id, :change)

      expect(municipality_change.municipality_code).to have_attributes(
        code: '100000',
        name: 'Neznáma'
      )
    end

    it 'can parse district changes' do
      expect(downloader).to receive(:download_file).with('abc').
        and_return(fixture_filepath('jobs/ra/fixtures/DavkaInit_20151009-04.xml'))

      subject.perform('abc', downloader: downloader)

      district_change = Ra::DistrictChange.first
      expect(district_change).to have_attributes(
        change_id: nil,
        district_id: 4764,
        municipality_id: 92,
        database_operation: 'INSERT',
        version_id: 1,
        created_reason: 'CREATE',
        valid_to: Time.parse('2004-04-30T23:59:59+02:00'),
        unique_numbering: false,

        change: nil,
        district_object: Ra::District.find(4764),
        municipality: Ra::Municipality.find(92),
      )

      expect(district_change.district_code).to have_attributes(
        code: '219755',
        name: 'Nivy'
      )
    end

    it 'creates batch record only after successful import' do
      expect(downloader).to receive(:download_file).with('abc').
        and_return(fixture_filepath('jobs/ra/fixtures/zmenovadavka1952939_with_invalid_tag.xml'))

      to_not_change_changes_batch_count = change { Ra::ChangesBatch.count }.by(0)

      expect { subject.perform('abc', downloader: downloader) }.to(
        raise_error(RuntimeError).and to_not_change_changes_batch_count
      )
    end
  end
end
