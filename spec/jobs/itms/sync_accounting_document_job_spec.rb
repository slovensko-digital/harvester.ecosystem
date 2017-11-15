require 'rails_helper'

RSpec.describe Itms::SyncAccountingDocumentJob, type: :job do
  include_context 'itms_downloader'
  let(:procurement) do
    Itms::Procurement.create!(
        itms_id: 123,
        projekty: [Itms::Project.create!(itms_id: 456)],
    )
  end

  context '#perform' do
    it 'syncs accounting document and all of its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/uctovneDoklady/3172')
          .and_return(double(body: itms_file_fixture('uctovny_doklad_item.json')))
          .once

      subject.perform('/v2/uctovneDoklady/3172', downloader: downloader)
      procurement.uctovne_doklady = [Itms::AccountingDocument.first]

      expect(Itms::AccountingDocument.first).to have_attributes(
        itms_id: 3172,
        itms_href: '/v2/uctovneDoklady/3172',
        itms_created_at: DateTime.parse('2016-11-16T11:40:55.739Z'),
        itms_updated_at: DateTime.parse('2016-11-17T11:40:55.739Z'),

        datum_uhrady: DateTime.parse('2016-11-21T00:00:00Z'),
        datum_vyhotovenia: DateTime.parse('2016-10-27T00:00:00Z'),
        dodavatel_dodavatel_obstaravatel: Itms::Supplier.find_by!(itms_id: 260),
        dodavatel_subjekt: Itms::Subject.find_by!(itms_id: 100077),
        nazov: 'Faktúra',
        polozky_dokladu: [
            Itms::AccountingDocumentItem.find_by!(
                itms_id: 9354,
                dph: 4500,
                jednotkova_cena: 22500,
                mnozstvo: 0,
                nazov: 'montážne práce',
                poradove_cislo: 1,
                sadzba_dph: 20,
                suma_bez_dph: 22500,
                suma_opravnena: 27000,
                suma_spolu: 27000,
                suma_ziadana: 27000,
                suma_zrealizovanych_vydavkov: 27000
            ),
            Itms::AccountingDocumentItem.find_by!(
                itms_id: 9355,
                dph: 339,
                jednotkova_cena: 1695,
                mnozstvo: 0,
                nazov: "ponorné kalové čerpadlo",
                poradove_cislo: 2,
                sadzba_dph: 20,
                suma_bez_dph: 1695,
                suma_opravnena: 2034,
                suma_spolu: 2034,
                suma_ziadana: 2034,
                suma_zrealizovanych_vydavkov: 2034
            ),
        ],
        projekty: [procurement.projekty],
        typ: 'EXTERNY',
        verejne_obstaravania: [procurement],
        vlastnik_dokladu: Itms::Subject.find_by!(itms_id: 100184)
      )
    end
  end
end
