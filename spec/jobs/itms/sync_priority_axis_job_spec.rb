require 'rails_helper'

RSpec.describe Itms::SyncPriorityAxisJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/prioritnaOs/33')
          .and_return(double(body: itms_file_fixture('prioritna_os_item.json')))

      subject.perform(33, downloader: downloader)

      expect(Itms::PriorityAxis.first).to have_attributes(
        itms_id: 33,
        itms_href: '/v2/prioritnaOs/33',
        itms_created_at: DateTime.parse('2017-02-23T18:09:03.502Z'),
        itms_updated_at: nil,

        celkova_financna_alokacia: 84341765,
        hlavna_alokacia: 84341765,
        kod: '313050',
        nazov: '5 Technická pomoc',
        vykonnostna_rezerva: 0,
      )
    end

    pending do
      expect(Itms::PriorityAxis.first).to respond_to(
        :operacny_program,
      )
    end
  end
end
