require 'rails_helper'

RSpec.describe Upvs::FetchPublicAuthorityEdesksListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://data.slovensko.sk/download?id=7dc7f9be-0d6f-4bac-b3fd-5df587da8ac1' }

    let(:downloader) { double }

    it 'downloads and imports all public authority eDesks' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks.csv'))

      subject.perform(downloader: downloader)

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
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks.csv'))

        subject.perform(downloader: downloader)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(7)
      end
    end

    context 'eDesks list does not match URI with CIN' do
      it 'does not import public authority eDesks' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-not-matching.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(0)
      end

      it 'retains previously imported public authority eDesks' do
        create_list(:upvs_public_authority_edesk, 10)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-not-matching.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::PublicAuthorityEdesk.count).to eq(10)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-not-matching.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error('ico://sk/99166260 does not match 166260')
      end

      it 'does not raise custom error if only leading zeros difference' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-missing-leading-zeros.csv'))

        expect { subject.perform(downloader: downloader) }.not_to raise_error

        expect(Upvs::PublicAuthorityEdesk.last).to have_attributes(
          uri: 'ico://sk/214973_10001',
          cin: 214973,
          name: 'CRH (Slovensko) a.s.',
        )

        expect(Upvs::PublicAuthorityEdesk.count).to eq(8)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/edesks-incorrect-encoding.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error('Incorrect encoding')
      end
    end
  end
end
