require 'rails_helper'

RSpec.describe Upvs::FetchPublicAuthorityEdesksListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://example.com' }

    let(:downloader) { double }

    it 'downloads and imports public authority eDesks in V1 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-v1.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/00332674',
        cin: 332674,
        name: 'Obec Petrovce, okres Vranov nad Topľou',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(7)
    end

    context 'eDesks list already imported' do
      it 'clears eDesks list, then imports eDesks' do
        create_list(:upvs_public_authority_edesk, 10)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-v1.csv'))

        subject.perform(url, downloader: downloader)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(7)
      end
    end

    context 'eDesks list does not match URI with CIN' do
      it 'does not import public authority eDesks' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-v1-not-matching.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(0)
      end

      it 'retains previously imported public authority eDesks' do
        create_list(:upvs_public_authority_edesk, 10)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-v1-not-matching.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(10)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-v1-not-matching.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error('ico://sk/99166260 does not match 166260')
      end
    end
  end
end
