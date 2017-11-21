require 'rails_helper'

RSpec.describe Itms::SyncActivityTypeJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    it 'syncs subject and all its attributes' do
      expect(downloader)
          .to receive(:get)
          .with('https://opendata.itms2014.sk/v2/typyAktivit/1')
          .and_return(double(body: itms_file_fixture('typ_aktivity_item.json')))

      subject.perform('/v2/typyAktivit/1', downloader: downloader)

      expect(Itms::ActivityType.first).to have_attributes(
        itms_id: 1,
        itms_href: '/v2/typyAktivit/1',
        itms_created_at: DateTime.parse('2015-05-19T10:05:00.656Z'),
        itms_updated_at: DateTime.parse('2015-05-22T11:57:01.308Z'),

        kod: '131202001',
        nazov: 'Vykonávanie opatrení podporujúcich mladých NEET za účelom získania udržateľného zamestnania alebo udržateľnej SZČ',
      )
    end
  end
end
