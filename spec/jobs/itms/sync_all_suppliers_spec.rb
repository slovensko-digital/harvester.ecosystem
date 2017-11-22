require 'rails_helper'

RSpec.describe Itms::SyncAllSuppliersJob, type: :job do
  let(:downloader) { double(:downloader) }

  context '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all subjects' do
      Itms::Supplier.create(itms_id: 1, itms_href: '/v2/dodavatelia/1')
      Itms::Supplier.create(itms_id: 2, itms_href: '/v2/dodavatelia/2')
      Itms::Supplier.create(itms_id: 3, itms_href: '/v2/dodavatelia/3')

      subject.perform

      expect(Itms::SyncSupplierJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncSupplierJob).to have_been_enqueued.with('/v2/dodavatelia/1')
      expect(Itms::SyncSupplierJob).to have_been_enqueued.with('/v2/dodavatelia/2')
      expect(Itms::SyncSupplierJob).to have_been_enqueued.with('/v2/dodavatelia/3')
    end
  end
end
