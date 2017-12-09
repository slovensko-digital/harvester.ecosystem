require 'rails_helper'

RSpec.describe Itms::DetectApiChangeJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'detects changes in swagger.json file' do
      expect(downloader)
        .to receive(:get)
        .with('https://opendata.itms2014.sk/v2/swagger.json')
        .and_return(double(body: itms_file_fixture('swagger_changed.json')))

      expect { subject.perform(downloader: downloader) }.to raise_error(described_class::ApiChangeDetectedException)
    end

    it "does not raise when the API hasn't changed" do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/swagger.json')
          .and_return(double(body: File.read(described_class::LAST_KNOWN_SWAGGER_PATH)))

      expect { subject.perform(downloader: downloader) }.not_to raise_error
    end

    it "ignores (auto-generated) definition example changes" do
      expect(downloader)
        .to receive(:get)
        .with('https://opendata.itms2014.sk/v2/swagger.json')
        .and_return(double(body: itms_file_fixture('swagger_example_changed.json')))

      expect { subject.perform(downloader: downloader) }.not_to raise_error
    end
  end
end
