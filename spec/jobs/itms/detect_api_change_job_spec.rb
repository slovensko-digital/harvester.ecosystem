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
  end
end