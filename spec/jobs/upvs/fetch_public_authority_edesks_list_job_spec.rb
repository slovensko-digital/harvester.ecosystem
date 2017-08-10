require 'rails_helper'

RSpec.describe Upvs::FetchPublicAuthorityEdesksListJob, type: :job do
  context '#perform' do
    it 'downloads and imports PublicAuthorityEdesks from data.gov.sk' do
      downloader = double
      expect(downloader).to receive(:download_file).with('https://data.gov.sk/dataset/7d918796-3c9a-44a5-95a9-7e1dfca76407/resource/456a5bc6-32bd-4346-bcd1-12ee171ac010/download/zoznamintituciisozriadenoues.csv').and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks.csv'))

      subject.perform(downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        cin: 42156424,
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
        street: 'Kollárova',
        street_number: nil,
        postal_code: '91702',
        city: 'Trnava',
        uri: 'ico://sk/42156424_90000'
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end

    it 'supports newer format' do
      downloader = double
      expect(downloader).to receive(:download_file).with('https://data.gov.sk/dataset/7d918796-3c9a-44a5-95a9-7e1dfca76407/resource/456a5bc6-32bd-4346-bcd1-12ee171ac010/download/zoznamintituciisozriadenoues.csv').and_return(fixture_filepath('jobs/upvs/fixtures/upvs-edesks-v2.csv'))

      subject.perform(downloader: downloader)

      expect(Upvs::PublicAuthorityEdesk.first).to have_attributes(
        name: 'Národná agentúra pre sieťové a elektronické služby: Test',
      )

      expect(Upvs::PublicAuthorityEdesk.count).to eq(5)
    end
  end
end
