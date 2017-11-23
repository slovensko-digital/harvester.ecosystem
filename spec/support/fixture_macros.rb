module FixtureMacros
  def fixture_filepath(file_path)
    Pathname.new('spec').join(file_path)
  end

  def file_fixture(file_path)
    File.read(fixture_filepath(file_path))
  end

  def itms_file_fixture(file_name)
    file_fixture("fixtures/itms/#{file_name}")
  end

  def itms_json_fixture(file_name)
    JSON.parse(itms_file_fixture(file_name))
  end
end

RSpec.configure do |config|
  config.include FixtureMacros
end
