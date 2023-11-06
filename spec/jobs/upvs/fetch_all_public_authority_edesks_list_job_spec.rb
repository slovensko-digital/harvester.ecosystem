require 'rails_helper'

RSpec.describe Upvs::FetchAllPublicAuthorityEdesksListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://example.com' }

    let(:downloader) { double }

    it 'downloads and imports all public authority eDesks' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::AllPublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/00332674',
        cin: 332674,
        name: 'Obec Petrovce, okres Vranov nad Topľou',
      )

      expect(Upvs::AllPublicAuthorityEdesk.count).to eq(7)
    end

    context 'eDesks list already imported' do
      it 'clears eDesks list, then imports eDesks' do
        create_list(:upvs_all_public_authority_edesk, 10)

        expect(Upvs::AllPublicAuthorityEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks.csv'))

        subject.perform(url, downloader: downloader)

        expect(Upvs::AllPublicAuthorityEdesk.count).to eq(7)
      end
    end

    context 'eDesks list does not match URI with CIN' do
      it 'does not import public authority eDesks' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks-not-matching.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::AllPublicAuthorityEdesk.count).to eq(0)
      end

      it 'retains previously imported public authority eDesks' do
        create_list(:upvs_all_public_authority_edesk, 10)

        expect(Upvs::AllPublicAuthorityEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks-not-matching.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::AllPublicAuthorityEdesk.count).to eq(10)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks-not-matching.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error('ico://sk/99166260 does not match 166260')
      end

      it 'does not raise custom error if only leading zeros difference' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks-missing-leading-zeros.csv'))

        expect { subject.perform(url, downloader: downloader) }.not_to raise_error

        expect(Upvs::AllPublicAuthorityEdesk.last).to have_attributes(
          uri: 'ico://sk/214973_10001',
          cin: 214973,
          name: 'CRH (Slovensko) a.s.',
        )

        expect(Upvs::AllPublicAuthorityEdesk.count).to eq(8)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/all-edesks-incorrect-encoding.csv'))

        expect { subject.perform(url, downloader: downloader) }.to raise_error('Incorrect encoding')
      end
    end
  end
end
