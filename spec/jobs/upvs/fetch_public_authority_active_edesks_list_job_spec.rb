require 'rails_helper'

RSpec.describe Upvs::FetchPublicAuthorityActiveEdesksListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://data.slovensko.sk/download?id=fa54d032-c8ec-4c92-8fbe-2b2730a9d202' }

    let(:downloader) { double }

    it 'downloads and imports public authority eDesks in V1 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1.csv'))

      subject.perform(downloader: downloader)

      expect(Upvs::PublicAuthorityActiveEdesk.first).to have_attributes(
        uri: 'ico://sk/00332674',
        cin: 332674,
        name: 'Obec Petrovce, okres Vranov nad Topľou',
      )

      expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(7)
    end

    context 'eDesks list already imported' do
      it 'clears eDesks list, then imports eDesks' do
        create_list(:upvs_public_authority_active_edesk, 10)

        expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1.csv'))

        subject.perform(downloader: downloader)

        expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(7)
      end
    end

    context 'eDesks list does not match URI with CIN' do
      it 'does not import public authority eDesks' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1-not-matching.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(0)
      end

      it 'retains previously imported public authority eDesks' do
        create_list(:upvs_public_authority_active_edesk, 10)

        expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1-not-matching.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error(RuntimeError)

        expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(10)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1-not-matching.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error('ico://sk/99166260 does not match 166260')
      end

      it 'does not raise custom error if only leading zeros difference' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1-missing-leading-zeros.csv'))

        # subject.perform(downloader: downloader)
        expect { subject.perform(downloader: downloader) }.not_to raise_error

        expect(Upvs::PublicAuthorityActiveEdesk.last).to have_attributes(
          uri: 'ico://sk/214973_10001',
          cin: 214973,
          name: 'CRH (Slovensko) a.s.',
        )

        expect(Upvs::PublicAuthorityActiveEdesk.count).to eq(8)
      end

      it 'raises custom error' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/active-edesks-v1-incorrect-encoding.csv'))

        expect { subject.perform(downloader: downloader) }.to raise_error('Incorrect encoding')
      end
    end
  end
end
