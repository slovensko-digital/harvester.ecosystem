require 'rails_helper'

RSpec.describe Upvs::FetchDigitalServicesAndFormsListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://example.com' }

    let(:downloader) { double }

    it 'downloads and imports DigitalServiceAndForm list in V1 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/services-v1.csv'))

      subject.perform(url, downloader: downloader)

      expect(Upvs::DigitalServiceAndForm.first).to have_attributes(
        id_service_instance: 2107,
        external_code: 'App.GeneralAgenda',
        meta_code: 'NULL',
        name: 'Veobecná agenda',
        service_type: 'Formulárové sluby',
        uri: 'ico://sk/30797764',
        institution_name: 'Agentúra na podporu výskumu a vývoja',
        url: 'https://schranka.slovensko.sk/FormConstructor/Default.aspx?IdService=2107',
        info_url: 'NULL',
        form_url: 'http://schemas.gov.sk/form/App.GeneralAgenda/1.9'
      )

      expect(Upvs::DigitalServiceAndForm.count).to eq(9)
    end

    context 'DigitalServiceAndForm list already imported' do
      it 'clears DigitalServiceAndForm list, then imports new data' do
        create_list(:digital_service_and_form, 10)

        expect(Upvs::DigitalServiceAndForm.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/services-v1.csv'))

        subject.perform(url, downloader: downloader)

        expect(Upvs::DigitalServiceAndForm.count).to eq(9)
      end
    end
  end
end
