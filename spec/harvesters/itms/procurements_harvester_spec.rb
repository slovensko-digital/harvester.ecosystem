require 'rails_helper'

RSpec.describe Itms::ProcurementsHarvester, type: :service do

  context '#run' do
    it 'loads and imports all procurements' do
      procurements_content = File.read(fixture_filepath('fixtures/files/verejne_obstaravania.json'))
      procurement_contracts_content = File.read(fixture_filepath('fixtures/files/zmluvy_verejneho_obstaravania.json'))
      supplier_content = File.read(fixture_filepath('fixtures/files/dodavatel.json'))
      downloader = double

      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/verejneObstaravania?minId=0&limit=100')
        .and_return(double('response', response_code: 200, body: procurements_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/verejneObstaravania?minId=8373586022319921000&limit=100')
        .and_return(double('response', response_code: 200, body: '[]')).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/verejneObstaravania/8373586022319921000/zmluvyVerejneObstaravanie')
        .and_return(double('response', response_code: 200, body: procurement_contracts_content)).at_least(:once)
      expect(downloader).to receive(:get).with('https://opendata.itms2014.sk/dodavatelia/1')
        .and_return(double('response', response_code: 200, body: supplier_content)).at_least(:once)
      expect {
        expect {
          described_class.run(min_id: 0, downloader: downloader)
        }.to change(Itms::Procurement, :count).by(1)
      }.to change(Itms::ProcurementContract, :count).by(1)

      procurement = Itms::Procurement.first
      expect(procurement).to have_attributes(
        itms_identifier: 8373586022319921000,
        cislo_vestnika: 'Omnis odit.',
        cislo_zverejnenia_vo_vestniku: 'Rerum ab.',
        created_at: DateTime.parse('2008-09-28T08:54:52+02:00'),
        datum_zverejnenia_vo_vestniku: DateTime.parse('2012-10-09T22:05:38+02:00'),
        kod: 'Explicabo consequatur doloremque inventore magni.',
        nazov: 'Est inventore esse eaque mollitia.',
        pocet_prijatych_ponuk: 8753804882895689000,
        pocet_vylucenych_ponuk: 5880104912417865000,
        predpokladana_hodnota_zakazky: 0.594210572872405,
        stav: 'Cumque distinctio odio deserunt ut ipsum suscipit.',
        updated_at: DateTime.parse('2015-09-27T09:03:35+02:00'),
        url_odkaz_oznamenie: 'Veniam autem quo.',
        zverejnene_vo_vestniku_eu: false
      )
      expect(procurement.procurement_order_type).to have_attributes(
        itms_identifier: 1296447484042784300,
        kod_zdroj: 'Deleniti corporis nulla omnis in.',
        nazov: 'Aut harum officia est aperiam.'
      )
      expect(procurement.procurement_additional_vocabularies.first).to have_attributes(
        itms_identifier: 1296447484042784300,
        kod_zdroj: 'Deleniti corporis nulla omnis in.',
        nazov: 'Aut harum officia est aperiam.'
      )
      expect(procurement.procurement_main_vocabulary).to have_attributes(
        itms_identifier: 1296447484042784300,
        kod_zdroj: 'Deleniti corporis nulla omnis in.',
        nazov: 'Aut harum officia est aperiam.'
      )
      expect(procurement.procurement_method_vo).to have_attributes(
        itms_identifier: 1296447484042784301,
        kod_zdroj: 'Deleniti corporis nulla omnis in.',
        nazov: 'Aut harum officia est aperiam.'
      )
      expect(procurement.procurement_factotum).to have_attributes(
        ico: 'Nihil nam tenetur quisquam harum aspernatur.',
        itms_identifier: 987741135256222700,
        ine_identifikacne_cislo: 'Quae mollitia quae ut corporis.'
      )
      expect(procurement.procurement_operational_programs.first).to have_attributes(
        itms_identifier: 4047731169218545000
      )
      expect(procurement.procurement_procedure).to have_attributes(
        itms_identifier: 1296447484042784300,
        kod_zdroj: 'Deleniti corporis nulla omnis in.',
        nazov: 'Aut harum officia est aperiam.'
      )
      expect(procurement.procurement_projects.first).to have_attributes(
        itms_identifier: 6058429222335320000
      )
      expect(procurement.procurement_accounting_documents.first).to have_attributes(
        itms_identifier: 2622646263305975300
      )
      expect(procurement.procurement_submitter).to have_attributes(
        ico: 'Atque error ad perferendis soluta autem.',
        itms_identifier: 3604616086874745000,
        ine_identifikacne_cislo: 'Omnis provident aperiam occaecati corrupti.'
      )

      contract = Itms::ProcurementContract.first
      expect(contract).to have_attributes(
        itms_identifier: 2387149493414072000,
        kod: 'Doloremque nobis rerum voluptates.',
        celkova_suma_zmluvy: 0.2429732565531440,
        cislo_zmluvy: 'Laboriosam ducimus.',
        created_at: DateTime.parse('1999-11-22T03:46:20+01:00'),
        datum_platnosti: DateTime.parse('1988-08-23T18:45:25+02:00'),
        datum_ucinnosti: DateTime.parse('1972-05-09T19:26:26+01:00'),
        nazov: 'Sed aliquid aspernatur eos.',
        predmet_zmluvy: 'Nam qui aut totam nam vero et.',
        suma_bez_dph: 0.822536933030054,
        updated_at: DateTime.parse('1994-05-22T09:50:19+02:00'),
        url_odkaz_na_zmluvu: 'Perferendis velit facere consequuntur non quae atque.',
        verejne_obstaravania_id: procurement.id
      )
      expect(contract.procurement_contract_another_urls.first).to have_attributes(
        nazov: 'Assumenda maxime error et.',
        url: 'Delectus magnam harum ipsam voluptatem.'
      )
      expect(contract.procurement_contract_suppliers.first).to have_attributes(
        je_hlavny_dodavatel: true
      )
      expect(contract.procurement_contract_suppliers.first.procurement_contract_supplier_supplier).to have_attributes(
        itms_identifier: 987741135256222700,
        ico: 'Nihil nam tenetur quisquam harum aspernatur.',
        ine_identifikacne_cislo: 'Quae mollitia quae ut corporis.'
      )
      expect(contract.procurement_contract_main_supplier).to have_attributes(
        ico: 'Nihil nam tenetur quisquam harum aspernatur.',
        itms_identifier: 987741135256222700,
        ine_identifikacne_cislo: 'Quae mollitia quae ut corporis.'
      )

      # procurement has been already stored, service should not fail
      expect {
        expect {
          described_class.run(min_id: 0, downloader: downloader)
        }.to change(Itms::Procurement, :count).by(0)
      }.to change(Itms::ProcurementContract, :count).by(0)
    end
  end
end
