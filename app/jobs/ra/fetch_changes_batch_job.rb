module Ra
  class RecordBuilder
    GENERIC_CHANGE_COLUMNS = [
      :changeId, :changedAt, :databaseOperation, :versionId, :createdReason,
      :validFrom, :validTo, :effectiveDate
    ]

    def initialize
      @data = {}
    end

    def report_changes_id(value)
      @data[:changes_id] = value
    end

    def report_changes_generated(value)
      @data[:generated_at] = value
    end

    def start_property_registration_change
      @pr_change = {}
    end

    def report_generic(tag)
      case tag.name
        when :propertyRegistrationNumberChange
          build_property_registration_number_change(tag)
        when :buildingNumberChange
          build_building_number_change(tag)
        when :buildingUnitChange
          build_building_unit_change(tag)
        when :streetNameChange
          build_street_name_change(tag)
        when :regionChange
          build_region_change(tag)
        when :countyChange
          build_county_change(tag)
        when :municipalityChange
          build_municipality_change(tag)
        when :districtChange
          build_district_change(tag)
        else
          fail "Don't know how to handle #{tag.name}"
      end
    end

    def report_end
      if @data[:changes_id]
        Ra::ChangesBatch.find_or_create_by!(id: @data[:changes_id], generated_at: Time.zone.parse(@data[:generated_at]))
      end
    end

    private

    def build_property_registration_number_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:property_registration_number_object] = Ra::PropertyRegistrationNumber.find_or_create_by!(id: id)
          when :PropertyRegistrationNumber
            payload[:property_registration_number] = Integer(child.children.first.value)
          when :Building
            payload[:building_contains_flats] = child.attrs[:ContainsFlats] == 'true'
            child.children.each do |ch|
              case ch.name
                when :BuildingPurpose
                  codelist = parse_codelist(ch.children.first)
                  fail unless codelist[:code] == 'CL010142'
                  if codelist[:item]
                    payload[:building_purpose_code] = Ra::BuildingPurposeCode.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
                  end
                when :BuildingTypeCode
                  codelist = parse_codelist(ch.children.first)
                  fail unless codelist[:code] == 'CL010143'
                  payload[:building_type_code] = Ra::BuildingTypeCode.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
                else
                  fail "Don't know how to handle #{ch.name}"
              end
            end
          when :municipalityIdentifier
            id = Integer(child.children.first.value)
            payload[:municipality] = Ra::Municipality.find_or_create_by!(id: id)
          when :districtIdentifier
            id = Integer(child.children.first.value)
            payload[:district] = Ra::District.find_or_create_by!(id: id)
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::PropertyRegistrationNumberChange.find_or_create_by!(payload)
    end

    def build_building_number_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:building_number_object] = Ra::BuildingNumber.find_or_create_by!(id: id)
          when :verifiedAt
            payload[:verified_at] = Time.zone.parse(child.children.first.value)
          when :BuildingNumber
            payload[:building_number] = child.children.first.value
          when :BuildingIndex
            payload[:building_index] = child.children.first.value
          when :PostalCode
            payload[:postal_code] = child.children.first.value
          when :AddressPoint
            payload[:address_point] = parse_address_point(child)
          when :propertyRegistrationNumberIdentifier
            id = Integer(child.children.first.value)
            payload[:property_registration_number] = Ra::PropertyRegistrationNumber.find_or_create_by!(id: id)
          when :streetNameIdentifier
            id = Integer(child.children.first.value)
            payload[:street_name] = Ra::StreetName.find_or_create_by!(id: id)
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::BuildingNumberChange.find_or_create_by!(payload)
    end

    def build_building_unit_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:building_unit_object] = Ra::BuildingUnit.find_or_create_by!(id: id)
          when :BuildingUnit
            payload[:building_unit_label] = child.children.first.value
            payload[:building_unit_floor] = child.attrs[:Floor]
            payload[:building_unit_number] = child.attrs.fetch(:UnitNumber)
          when :buildingNumberIdentifier
            payload[:building_number_id] = Integer(child.children.first.value)
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::BuildingUnitChange.find_or_create_by!(payload)
    end

    def build_street_name_change(tag)
      payload = {}
      municipalities_payload = []
      districts_payload = []

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:street_name_object] = Ra::StreetName.find_or_create_by!(id: id)
          when :StreetName
            payload[:street_name] = child.children.first.value
          when :municipalityIdentifier
            id = Integer(child.children.first.value)
            municipalities_payload << Ra::Municipality.find_or_create_by!(id: id)
          when :districtIdentifier
            id = Integer(child.children.first.value)
            districts_payload << Ra::District.find_or_create_by!(id: id)
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      street_name_change = Ra::StreetNameChange.find_or_initialize_by(payload)
      street_name_change.municipalities = municipalities_payload
      street_name_change.districts = districts_payload
      street_name_change.save!
    end

    def build_region_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:region_object] = Ra::Region.find_or_create_by!(id: id)
          when :Region
            codelist = parse_codelist(child.children.first)
            fail unless codelist[:code] == 'CL000023'
            payload[:region_code] = Ra::RegionCode.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::RegionChange.find_or_create_by!(payload)
    end

    def build_county_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:county_object] = Ra::County.find_or_create_by!(id: id)
          when :regionIdentifier
            id = Integer(child.children.first.value)
            payload[:region] = Ra::Region.find_or_create_by!(id: id)
          when :County
            codelist = parse_codelist(child.children.first)
            fail unless codelist[:code] == 'CL000024'
            payload[:county_code] = Ra::CountyCode.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::CountyChange.find_or_create_by!(payload)
    end

    def build_municipality_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:municipality_object] = Ra::Municipality.find_or_create_by!(id: id)
          when :countyIdentifier
            id = Integer(child.children.first.value)
            payload[:county] = Ra::County.find_or_create_by!(id: id)
          when :cityIdentifier
            id = Integer(child.children.first.value)
            payload[:city_id] = id
          when :status
            payload[:municipality_status] = child.children.first.value
          when :Municipality
            codelist = parse_codelist(child.children.first)
            fail unless codelist[:code] == 'CL000025'
            payload[:municipality_code] = Ra::MunicipalityCode.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::MunicipalityChange.find_or_create_by!(payload)
    end

    def build_district_change(tag)
      payload = {}

      tag.children.each do |child|
        case child.name
          when *GENERIC_CHANGE_COLUMNS
            payload.merge!(parse_generic_change_tag(child))
          when :objectId
            id = Integer(child.children.first.value)
            payload[:district_object] = Ra::District.find_or_create_by!(id: id)
          when :municipalityIdentifier
            id = Integer(child.children.first.value)
            payload[:municipality] = Ra::Municipality.find_or_create_by!(id: id)
          when :District
            payload[:unique_numbering] = child.attrs[:UniqueNumbering] == 'true'
            codelist = parse_codelist(child.children.first)
            fail unless codelist[:code] == 'CL010141'
            payload[:district_code] = Ra::DistrictCode.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::DistrictChange.find_or_create_by!(payload)
    end

    def parse_generic_change_tag(tag)
      payload = {}

      case tag.name
        when :changeId
          id = Integer(tag.children.first.value)
          payload[:change] = Ra::Change.find_or_create_by!(id: id)
        when :changedAt
          payload[:changed_at] = Time.zone.parse(tag.children.first.value)
        when :databaseOperation
          payload[:database_operation] = tag.children.first.value
        when :versionId
          payload[:version_id] = Integer(tag.children.first.value)
        when :createdReason
          payload[:created_reason] = tag.children.first.value
        when :validFrom
          payload[:valid_from] = Time.zone.parse(tag.children.first.value)
        when :validTo
          payload[:valid_to] = Time.zone.parse(tag.children.first.value)
        when :effectiveDate
          payload[:effective_on] = Date.parse(tag.children.first.value)
      end

      payload
    end

    def parse_codelist(tag)
      codelist = {}
      tag.children.each do |child|
        case child.name
          when :CodelistCode
            codelist[:code] = child.children.first.value
          when :CodelistItem
            codelist[:item] = parse_codelist_item(child)
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      codelist
    end

    def parse_codelist_item(tag)
      item = {}
      tag.children.each do |child|
        case child.name
          when :ItemCode
            item[:code] = child.children.first.value
          when :ItemName
            item[:name] = child.children.first.value
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      item
    end

    def parse_address_point(tag)
      out = nil
      tag.children.each do |ch|
        case ch.name
          when :BLH
            out = parse_blh(ch)
          else
            fail "Don't know how to handle #{ch.name}"
        end
      end

      out
    end

    def parse_blh(tag)
      lat = nil
      lon = nil
      tag.children.each do |ch|
        case ch.name
          when :AxisB, :axisB
            lat = ch.children.first.value
          when :AxisL, :axisL
            lon = ch.children.first.value
          else
            fail "Don't know how to handle #{ch.name}"
        end
      end

      "POINT(#{lon} #{lat})"
    end
  end

  class ChangesIdParser
    def text(value, stack, listener)
      listener.report_changes_id(value)
      stack.pop
    end
  end

  class ChangesGeneratedParser
    def text(value, stack, listener)
      listener.report_changes_generated(value)
      stack.pop
    end
  end

  class Tag
    attr_reader :name, :children, :attrs

    def initialize(name)
      @name = name
      @children = []
      @attrs = {}
    end

    def add_child(child)
      @children.push(child)
    end

    def add_attr(name, value)
      @attrs[name] = value
    end
  end

  class TextNode
    attr_reader :value

    def initialize(value)
      @value = value
    end
  end

  class GenericParser
    def initialize(root_tag)
      @root_tag = root_tag
      @stack = [Tag.new(root_tag)]
      @current = @stack.last
    end

    def start_element(name, stack, listener)
      elm = Tag.new(name)
      @stack.push(elm)
      @current.add_child(elm)
      @current = elm
    end

    def text(value, stack, listener)
      @current.add_child(TextNode.new(value))
    end

    def attr(name, value, stack, listener)
      @current.add_attr(name, value)
    end

    def end_element(node, stack, listener)
      if node == @root_tag
        listener.report_generic(@current)
        stack.pop
      else

        @stack.pop
        @current = @stack.last
      end
    end
  end


  class XMLParser
    def instruct(name, stack, listener)
      fail unless name == 'xml'
    end

    def start_element(name, stack, listener)
      case name
        when :'ns0:getChangesResponse', :'ns0:register'
        when :return
        when :corrId
        when :resultCode
        when :changesId
          stack.push(ChangesIdParser.new)
        when :changesGenerated
          stack.push(ChangesGeneratedParser.new)
        when :propertyRegistrationNumberChange, :buildingNumberChange, :buildingUnitChange,
          :districtChange, :streetNameChange, :regionChange, :municipalityChange, :countyChange
          stack.push(GenericParser.new(name))
        when :register
        when :type
        when :count
        else
          fail "Don't know how to handle #{name}"
      end
    end

    def end_element(name, stack, listener)
      case name
        when :'ns0:getChangesResponse'
          listener.report_end
        when :'ns0:register'
        when :return
        when :corrId
        when :resultCode
        when :changesId
        when :changesGenerated
        when :register
        when :type
        when :count
        else
          fail "Don't know how to handle #{name}"
      end
    end

    def attr(*)
    end

    def text(*)

    end
  end
end

class Stack
  def initialize
    @stack = [Ra::XMLParser.new]
    @current = @stack.first
  end

  def push(state)
    @stack.push(state)
    @current = state
  end

  def pop
    @stack.pop
    @current = @stack.last
  end

  def current
    @current
  end
end

class Sample < ::Ox::Sax
  def initialize(listener)
    @listener = listener
    @stack = Stack.new
  end

  def instruct(name)
    @stack.current.instruct(name, @stack, @listener)
  end

  def start_element(name)
    @stack.current.start_element(name, @stack, @listener)
  end

  def end_element(name)
    @stack.current.end_element(name, @stack, @listener)
  end

  def attr(name, value)
    @stack.current.attr(name, value, @stack, @listener)
  end

  def text(value)
    @stack.current.text(value, @stack, @listener)
  end
end

class Ra::FetchChangesBatchJob
  include Sidekiq::Worker
  include Sidekiq::Symbols

  sidekiq_options queue: 'ra'

  sidekiq_retry_in do |_count|
    1.day.to_i
  end

  def perform(url, downloader: ::Harvester::Utils)
    file = downloader.download_file(url)
    perform_on_file(file)
  end

  def perform_on_file(path)
    Ra::ChangesBatch.transaction do
      handler = Sample.new(Ra::RecordBuilder.new)
      Ox.sax_parse(handler, File.open(path, 'r'))
    end
  end
end
