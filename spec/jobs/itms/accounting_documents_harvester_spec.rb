require 'rails_helper'

RSpec.describe Itms::AccountingDocumentsHarvester, type: :service do

  context '#run' do
    it 'loads and imports all accounting documents' do
      documents_content = File.read(fixture_filepath('fixtures/files/uctovne_doklady.json'))
      document_content = File.read(fixture_filepath('fixtures/files/uctovny_doklad.json'))
      supplier_content = File.read(fixture_filepath('fixtures/files/dodavatel.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/uctovneDoklady?minId=0&limit=100')
        .and_return(double('response', response_code: 500, body: '[]')).once
      expect{ described_class.run(min_id: 0, downloader: downloader) }.to raise_error(Itms::Harvester::ApiError)
      
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/uctovneDoklady?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: documents_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/uctovneDoklady/3422888082168929300')
        .and_return(double('response', response_code: 200, body: document_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/uctovneDoklady?minId=3422888082168929300&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/v1/dodavatelia/1')
        .and_return(double('response', response_code: 200, body: supplier_content)).at_least(:once)
      expect {
        expect {
          described_class.run(min_id: 0, downloader: downloader)
        }.to change(Itms::Supplier, :count).by(1)
      }.to change(Itms::AccountingDocument, :count).by(1)

      document = Itms::AccountingDocument.first
      expect(document).to have_attributes(
        itms_identifier: 3422888082168929300,
        celkova_vyska_dokladu: 0.856738633006217,
        cislo_dokladu: '12345',
        created_at: DateTime.parse('2009-10-13T23:16:59+02:00'),
        datum_uhrady: DateTime.parse('1983-10-05T15:57:49+01:00'),
        datum_vyhotovenia: DateTime.parse('1985-07-21T05:35:18+02:00'),
        nazov: 'Est cum tempore doloremque voluptas sed est.',
        typ: 'Repudiandae in ut molestias eaque est possimus.',
        updated_at: DateTime.parse('1990-05-09T23:41:12+02:00')
      )
      expect(document.accounting_document_supplier).to have_attributes(
        itms_identifier: 987741135256222700,
        ico: 'Nihil nam tenetur quisquam harum aspernatur.',
        ine_identifikacne_cislo: 'Quae mollitia quae ut corporis.'
      )
      expect(document.accounting_document_owner).to have_attributes(
        itms_identifier: 3604616086874745000,
        ico: 'Atque error ad perferendis soluta autem.',
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )
      expect(document.accounting_document_items.first).to have_attributes(
        itms_identifier: 5660785199856854000,
        dph: 0.142084363802654,
        jednotkova_cena: 0.768789218352151
      )
      expect(document.accounting_document_projects.first).to have_attributes(
        itms_identifier: 6058429222335320000
      )
      expect(document.accounting_document_procurements.first).to have_attributes(
        itms_identifier: 2302335656381187800
      )
      expect(Itms::Supplier.first).to have_attributes(
        itms_identifier: 987741135256222700,
        created_at: DateTime.parse('1981-01-26T18:32:36+01:00'),
        dic: 'Natus molestiae incidunt.',
        ico: 'Nihil nam tenetur quisquam harum aspernatur.',
        ine_identifikacne_cislo: 'Quae mollitia quae ut corporis.',
        nazov: 'Non quas deserunt quis.',
        updated_at: DateTime.parse('1982-12-05T12:48:10+01:00')
      )

      # document has been already stored, service should not fail
      expect {
        expect {
          described_class.run(min_id: 0, downloader: downloader)
        }.to change(Itms::Supplier, :count).by(0)
      }.to change(Itms::AccountingDocument, :count).by(0)
    end
  end
end
