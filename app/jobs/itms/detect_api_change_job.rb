class Itms::DetectApiChangeJob < ItmsJob
  LAST_KNOWN_SWAGGER_PATH = Pathname.new('vendor/itms/swagger.json')
  ApiChangeDetectedException = Class.new(RuntimeError)

  def perform(downloader: ItmsJob::Downloader)
    current_swagger = downloader.get('https://opendata.itms2014.sk/v2/swagger.json').body
    last_known_swagger = File.read(LAST_KNOWN_SWAGGER_PATH)

    current_swagger_json = JSON.parse(current_swagger)
    last_known_swagger_json = JSON.parse(last_known_swagger)

    # Do not compare (automatically-generated) examples
    reject_definition_examples!(current_swagger_json)
    reject_definition_examples!(last_known_swagger_json)

    raise ApiChangeDetectedException unless current_swagger_json == last_known_swagger_json
  end

  private

  def reject_definition_examples!(swagger_json)
    swagger_json['definitions'].each_value do |definition|
      definition.except!('example')
    end
  end
end
