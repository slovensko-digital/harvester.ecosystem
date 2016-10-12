module Ra
  class RecordBuilder
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
      # puts tag.inspect
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
        else
          fail "Don't know how to handle #{tag.name}"
      end
    end

    def report_end
      if @data[:changes_id]
        Ra::ChangesBatch.find_or_create_by!(id: @data[:changes_id], generated_at: Time.parse(@data[:generated_at]))
      end
    end

    private

    def build_property_registration_number_change(tag)
      payload = {}
      tag.children.each do |child|
        case child.name
          when :changeId
            payload[:id] = child.children.first.value.to_i
          when :changedAt
            payload[:changed_at] = Time.parse(child.children.first.value)
          when :databaseOperation
            payload[:database_operation] = child.children.first.value
          when :objectId
            payload[:property_registration_number_id] = child.children.first.value.to_i
          when :versionId
            payload[:version_id] = child.children.first.value.to_i
          when :createdReason
            payload[:created_reason] = child.children.first.value
          when :validFrom
            payload[:valid_from] = Time.parse(child.children.first.value)
          when :validTo
            payload[:valid_to] = Time.parse(child.children.first.value)
          when :effectiveDate
            payload[:effective_on] = Date.parse(child.children.first.value)
          when :PropertyRegistrationNumber
            payload[:property_registration_number] = child.children.first.value.to_i
          when :Building
            payload[:building_contains_flats] = child.attrs[:ContainsFlats] == 'true'
            child.children.each do |ch|
              case ch.name
                when :BuildingPurpose
                  codelist = parse_codelist(ch.children.first)
                  fail unless codelist[:code] == 'CL010142'
                  if codelist[:item]
                    payload[:building_purpose] = Ra::BuildingPurpose.find_or_create_by!(code: codelist[:item][:code], name: codelist[:item][:name])
                  end
                when :BuildingTypeCode
                  codelist = parse_codelist(ch.children.first)
                  fail unless codelist[:code] == 'CL010143'
                  payload[:building_type] = Ra::BuildingType.find_or_create_by!(id: codelist[:item][:code], name: codelist[:item][:name])
                else
                  fail "Don't know how to handle #{ch.name}"
              end
            end
          when :municipalityIdentifier
            payload[:municipality_id] = child.children.first.value.to_i
          when :districtIdentifier
            payload[:district_id] = child.children.first.value.to_i
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
          when :changeId
            payload[:id] = Integer(child.children.first.value)
          when :changedAt
            payload[:changed_at] = Time.parse(child.children.first.value)
          when :databaseOperation
            payload[:database_operation] = child.children.first.value
          when :objectId
            payload[:building_number_id] = Integer(child.children.first.value)
          when :versionId
            payload[:version_id] = Integer(child.children.first.value)
          when :createdReason
            payload[:created_reason] = child.children.first.value
          when :validFrom
            payload[:valid_from] = Time.parse(child.children.first.value)
          when :validTo
            payload[:valid_to] = Time.parse(child.children.first.value)
          when :effectiveDate
            payload[:effective_on] = Date.parse(child.children.first.value)
          when :verifiedAt
            payload[:verified_at] = Time.parse(child.children.first.value)
          when :BuildingNumber
            payload[:building_number] = child.children.first.value
          when :BuildingIndex
            payload[:building_index] = child.children.first.value
          when :PostalCode
            payload[:postal_code] = child.children.first.value
          when :AddressPoint
            payload[:address_point] = parse_address_point(child)
          when :propertyRegistrationNumberIdentifier
            payload[:property_registration_number_id] = Integer(child.children.first.value)
          when :streetNameIdentifier
            payload[:street_name_id] = Integer(child.children.first.value)
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
          when :changeId
            payload[:id] = Integer(child.children.first.value)
          when :changedAt
            payload[:changed_at] = Time.parse(child.children.first.value)
          when :databaseOperation
            payload[:database_operation] = child.children.first.value
          when :objectId
            payload[:building_unit_id] = Integer(child.children.first.value)
          when :versionId
            payload[:version_id] = Integer(child.children.first.value)
          when :createdReason
            payload[:created_reason] = child.children.first.value
          when :validFrom
            payload[:valid_from] = Time.parse(child.children.first.value)
          when :validTo
            payload[:valid_to] = Time.parse(child.children.first.value)
          when :effectiveDate
            payload[:effective_on] = Date.parse(child.children.first.value)
          when :BuildingUnit
            payload[:building_unit_label] = child.children.first.value
            payload[:building_unit_floor] = child.attrs.fetch(:Floor)
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
      tag.children.each do |child|
        case child.name
          when :changeId
            payload[:id] = Integer(child.children.first.value)
          when :changedAt
            payload[:changed_at] = Time.parse(child.children.first.value)
          when :databaseOperation
            payload[:database_operation] = child.children.first.value
          when :objectId
            payload[:street_name_id] = Integer(child.children.first.value)
          when :versionId
            payload[:version_id] = Integer(child.children.first.value)
          when :createdReason
            payload[:created_reason] = child.children.first.value
          when :validFrom
            payload[:valid_from] = Time.parse(child.children.first.value)
          when :validTo
            payload[:valid_to] = Time.parse(child.children.first.value)
          when :effectiveDate
            payload[:effective_on] = Date.parse(child.children.first.value)
          when :StreetName
            payload[:street_name] = child.children.first.value
          when :municipalityIdentifier
            payload[:municipality_id] = Integer(child.children.first.value)
          when :districtIdentifier
            payload[:district_id] = Integer(child.children.first.value)
          else
            fail "Don't know how to handle #{child.name}"
        end
      end

      Ra::StreetNameChange.find_or_create_by!(payload)
    end

    def build_region_change(tag)
      payload = {}
      tag.children.each do |child|
        case child.name
          when :changeId
            payload[:id] = Integer(child.children.first.value)
          when :changedAt
            payload[:changed_at] = Time.parse(child.children.first.value)
          when :databaseOperation
            payload[:database_operation] = child.children.first.value
          when :objectId
            payload[:region_id] = Integer(child.children.first.value)
          when :versionId
            payload[:version_id] = Integer(child.children.first.value)
          when :createdReason
            payload[:created_reason] = child.children.first.value
          when :validFrom
            payload[:valid_from] = Time.parse(child.children.first.value)
          when :validTo
            payload[:valid_to] = Time.parse(child.children.first.value)
          when :effectiveDate
            payload[:effective_on] = Date.parse(child.children.first.value)
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
          when :changeId
            payload[:id] = Integer(child.children.first.value)
          when :changedAt
            payload[:changed_at] = Time.parse(child.children.first.value)
          when :databaseOperation
            payload[:database_operation] = child.children.first.value
          when :objectId
            payload[:county_id] = Integer(child.children.first.value)
          when :versionId
            payload[:version_id] = Integer(child.children.first.value)
          when :createdReason
            payload[:created_reason] = child.children.first.value
          when :validFrom
            payload[:valid_from] = Time.parse(child.children.first.value)
          when :validTo
            payload[:valid_to] = Time.parse(child.children.first.value)
          when :effectiveDate
            payload[:effective_on] = Date.parse(child.children.first.value)
          when :regionIdentifier
            payload[:region_id] = Integer(child.children.first.value)
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
          when :AxisB
            lat = ch.children.first.value
          when :AxisL
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
          :districtChange, :streetNameChange, :regionChange, :countyChange
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
        when :'ns0:register'
          listener.report_end
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
    # puts "instruct: #{name}"
    @stack.current.instruct(name, @stack, @listener)
  end

  def start_element(name)
    # puts "start: #{name}"
    @stack.current.start_element(name, @stack, @listener)
  end

  def end_element(name)
    # puts "end: #{name}"
    @stack.current.end_element(name, @stack, @listener)
  end

  def attr(name, value)
    # puts "  #{name} => #{value}"
    @stack.current.attr(name, value, @stack, @listener)
  end

  def text(value)
    # puts "text #{value}"
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
    handler = Sample.new(Ra::RecordBuilder.new)
    Ox.sax_parse(handler, File.open(path, 'r'))
  end
end
