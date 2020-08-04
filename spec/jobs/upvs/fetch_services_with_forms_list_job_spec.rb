require 'rails_helper'

RSpec.describe Upvs::FetchServicesWithFormsListJob, type: :job do
  describe '#perform' do
    let(:url) { 'https://example.com' }

    let(:downloader) { double }

    it 'downloads and imports ServicesWithForms list in V2 format' do
      expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/services-v2.csv'))
      subject.perform(url, downloader: downloader)

      expect(Upvs::ServiceWithForm.first).to have_attributes(
        instance_id: 2088,
        external_code: 'App.GeneralAgenda',
        meta_is_code: nil,
        name: 'Všeobecná agenda',
        type: 'Formulárové služby',
        institution_uri: 'ico://sk/30810787',
        institution_name: 'Úrad priemyselného vlastníctva Slovenskej republiky',
        url: 'https://schranka.slovensko.sk/FormConstructor/Default.aspx?IdService=2088',
        info_url: nil,
        schema_url: 'http://schemas.gov.sk/form/App.GeneralAgenda/1.9'
      )

      expect(Upvs::ServiceWithForm.count).to eq(20)
    end

    context 'meta_is_code and info_url attributes not nil' do
      it 'downloads and imports ServicesWithForms list in V1 format' do
        expect(downloader).to receive(:download_file).with(url).and_return(fixture_filepath('upvs/services-v1.csv'))
        subject.perform(url, downloader: downloader)

        expect(Upvs::ServiceWithForm.first).to have_attributes(
          instance_id: 29644,
          external_code: 'sluzba_is_703',
          meta_is_code: 'sluzba_egov_8653',
          name: 'Opravy, zmeny zápisov a dodatočných zápisov matričných udalostí',
          type: 'Externé služby',
          institution_uri: 'ico://sk/00151866',
          institution_name: 'Ministerstvo vnútra Slovenskej republiky',
          url: 'https://portal.minv.sk/wps/wcm/connect/sk/site/main/zivotne-situacie/matrika-zivotna-udalost/ziadost-zmena-mena-priezviska-ine+zmeny-opravy/podanie-ziadosti+o+opravy-zmeny+zapisov+a+dodatocnych+zapisov+matricnych+udalosti/',
          info_url: 'http://portal.minv.sk/wps/wcm/connect/sk/site/main/zivotne-situacie/matrika-zivotna-udalost/ziadost-zmena-mena-priezviska-ine+zmeny-opravy/podanie-ziadosti+o+opravy-zmeny+zapisov+a+dodatocnych+zapisov+matricnych+udalosti/',
          schema_url: nil
        )

        expect(Upvs::ServiceWithForm.count).to eq(12)
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
