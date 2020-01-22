require 'rails_helper'

RSpec.describe Upvs::FetchServicesWithFormsListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://example.com' }

    let(:downloader) { double }

    it 'downloads and imports ServicesWithForms list in V2 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/services-v2.csv'))
      subject.perform(url, downloader: downloader)

      expect(Upvs::ServiceWithForm.first).to have_attributes(
        instance_id: 2085,
        external_code: 'App.GeneralAgenda',
        meta_is_code: nil,
        name: 'Všeobecná agenda',
        type: 'Formulárové služby',
        institution_uri: 'ico://sk/00151513',
        institution_name: 'Úrad vlády Slovenskej republiky',
        url: 'https://schranka.slovensko.sk/FormConstructor/Default.aspx?IdService=2085',
        info_url: nil,
        schema_url: 'http://schemas.gov.sk/form/App.GeneralAgenda/1.9'
      )

      expect(Upvs::ServiceWithForm.count).to eq(20)
    end

    xcontext 'meta_is_code and info_url attributes not nil' do
      it 'downloads and imports ServicesWithForms list in V1 format' do
      end
    end

    context 'ServicesWithForms list already imported' do
      it 'clears ServicesWithForms list, then imports new data' do
        create_list(:upvs_service_with_form, 10)

        expect(Upvs::ServiceWithForm.count).to eq(10)
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/services-v2.csv'))

        subject.perform(url, downloader: downloader)

        expect(Upvs::ServiceWithForm.count).to eq(20)
      end
    end
  end
end
