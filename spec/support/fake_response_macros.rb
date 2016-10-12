module FakeResponseMacros
  def fake_response(file_path, status: 200)
    double(:fake_response, status: status, body: file_fixture(file_path))
  end

  def fixture_filepath(file_path)
    Pathname.new('spec').join(file_path)
  end

  def file_fixture(file_path)
    File.read(fixture_filepath(file_path))
  end
end

RSpec.configure do |config|
  config.include FakeResponseMacros
end
