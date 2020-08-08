# TODO remove this in favor of Rails 5 file_fixture helper

module FixtureMacros
  def fixture_filepath(file_path)
    Pathname.new('spec').join('fixtures', file_path)
  end

  def file_fixture(file_path)
    File.read(fixture_filepath(file_path))
  end

  def itms_file_fixture(file_name)
    file_fixture(File.join('itms', file_name))
  end

  def itms_json_fixture(file_name)
    JSON.parse(itms_file_fixture(file_name))
  end
end

RSpec.configure do |config|
  config.include FixtureMacros
end
