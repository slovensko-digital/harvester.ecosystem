module FixtureMacros
  def fixture_filepath(file_path)
    Pathname.new('spec').join(file_path)
  end

  def file_fixture(file_path)
    File.read(fixture_filepath(file_path))
  end
end

RSpec.configure do |config|
  config.include FixtureMacros
end
