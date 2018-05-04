require 'rails_helper'

RSpec.describe Upvs::FetchPublicAuthorityEdesksListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://example.com' }

    let(:downloader) { double }

    it 'downloads and imports public authority eDesks in V1 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks-v1.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/42156424_90000',
        cin: 42156424,
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
        street: 'Kollárova',
        street_number: nil,
        postal_code: '91702',
        city: 'Trnava',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end

    it 'downloads and imports public authority eDesks in V2 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks-v2.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/42156424_90000',
        cin: 42156424,
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
        street: 'Kollárova',
        street_number: nil,
        postal_code: '91702',
        city: 'Trnava',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end

    it 'downloads and imports public authority eDesks in V3 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks-v3.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/42156424_90000',
        cin: 42156424,
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
        street: 'Kollárova',
        street_number: nil,
        postal_code: '91702',
        city: 'Trnava',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end

    it 'downloads and imports public authority eDesks in V4 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks-v4.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/42156424_90000',
        cin: 42156424,
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
        street: 'Kollárova',
        street_number: nil,
        postal_code: '91702',
        city: 'Trnava',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end

    it 'downloads and imports public authority eDesks in V5 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks-v5.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        uri: 'ico://sk/42156424_90000',
        cin: 42156424,
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
        street: 'Kollárova',
        street_number: nil,
        postal_code: '91702',
        city: 'Trnava',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end
  end
end
