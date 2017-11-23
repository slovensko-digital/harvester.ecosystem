RSpec.shared_context "itms_downloader", :shared_context => :metadata do
  let(:downloader) { double(:downloader) }

  before do
    allow(downloader).to receive(:href_exists?).and_return(true)

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/subjekty/')) do |href|
        json_fixture('subjekt_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/dodavatelia/')) do |href|
        json_fixture('dodavatel_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/typyAktivit/')) do |href|
        json_fixture('typ_aktivity_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/konkretnyCiel/')) do |href|
        json_fixture('konkretny_ciel_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/nezrovnalost/')) do |href|
        json_fixture('nezrovnalost_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/prioritnaOs/')) do |href|
        json_fixture('prioritna_os_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/hodnotaCiselnika/')) do |href|
        json_fixture('hodnota_ciselnika_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with('/v2/ciselniky')
      .and_return(itms_json_fixture('ciselniky_list.json'))

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/prioritnaOs/')) do |href|
        json_fixture('prioritna_os_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/operacneProgramy/')) do |href|
        json_fixture('operacny_program_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/aktivita/')) do |href|
        json_fixture('aktivita_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/intenzita/')) do |href|
        json_fixture('intenzita_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/projektovyUkazovatel/')) do |href|
        json_fixture('projektovy_ukazovatel_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/pohladavkovyDoklad/')) do |href|
        json_fixture('pohladavkovy_doklad_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/projekty/')) do |href|
        json_fixture('projekt_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/verejneObstaravania/')) do |href|
        json_fixture('verejne_obstaravanie_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zmluvaVerejneObstaravanie/')) do |href|
        json_fixture('zmluva_verejne_obstaravanie_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/vyzvy/planovane')) do |href|
        json_fixture('vyzva_planovana_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/vyzvy/vyhlasene')) do |href|
        json_fixture('vyzva_vyhlasena_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/polozkaRozpoctu/')) do |href|
        json_fixture('polozka_rozpoctu_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/uctovneDoklady/')) do |url|
        id_specific_accounting_document_fixture(url)
    end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zop/predlozene/')) do |href|
        json_fixture('zop_predlozena_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zop/uhradene/')) do |href|
        json_fixture('zop_uhradena_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zop/zamietnute/')) do |href|
        json_fixture('zop_zamietnuta_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zonfp/prijate/')) do |href|
        json_fixture('zonfp_prijata_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zonfp/schvalene/')) do |href|
        json_fixture('zonfp_schvalena_item.json', href)
      end

    allow(downloader)
      .to receive(:get_json_from_href)
      .with(include('/v2/zonfp/zamietnute/')) do |href|
        json_fixture('zonfp_zamietnuta_item.json', href)
      end
  end

  def id_specific_accounting_document_fixture(url)
    itms_id = url.split('/').last
    fixture = json_fixture('uctovny_doklad_item.json', url)
    fixture['polozkyDokladu'].map { |pd| pd['id'] = "#{itms_id}#{pd['id']}".to_i }
    fixture
  end

  def json_fixture(json_file, url)
    itms_id = url.split('/').last
    fixture = itms_json_fixture(json_file)
    fixture['id'] = Integer(itms_id)
    fixture
  end
end
