RSpec.shared_context "itms_downloader", :shared_context => :metadata do
  let(:downloader) { double(:downloader) }

  before do
    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/subjekty/'))
        .and_return(double(body: itms_file_fixture('subjekt_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/typyAktivit/'))
        .and_return(double(body: itms_file_fixture('typ_aktivity_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/konkretnyCiel/'))
        .and_return(double(body: itms_file_fixture('konkretny_ciel_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/nezrovnalost/'))
        .and_return(double(body: itms_file_fixture('nezrovnalost_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/prioritnaOs/'))
        .and_return(double(body: itms_file_fixture('prioritna_os_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/hodnotaCiselnika/'))
        .and_return(double(body: itms_file_fixture('hodnota_ciselnika_item.json')))

    allow(downloader)
        .to receive(:get)
        .with('https://opendata.itms2014.sk/v2/ciselniky')
        .and_return(double(body: itms_file_fixture('ciselniky_list.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/prioritnaOs/'))
        .and_return(double(body: itms_file_fixture('prioritna_os_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/operacneProgramy/'))
        .and_return(double(body: itms_file_fixture('operacny_program_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/aktivita/'))
        .and_return(double(body: itms_file_fixture('aktivita_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/intenzita/'))
        .and_return(double(body: itms_file_fixture('intenzita_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/projektovyUkazovatel/'))
        .and_return(double(body: itms_file_fixture('projektovy_ukazovatel_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/pohladavkovyDoklad/'))
        .and_return(double(body: itms_file_fixture('pohladavkovy_doklad_item.json')))

    allow(downloader)
        .to receive(:get)
        .with(include('https://opendata.itms2014.sk/v2/projekty/'))
        .and_return(double(body: itms_file_fixture('projekt_item.json')))
  end
end
