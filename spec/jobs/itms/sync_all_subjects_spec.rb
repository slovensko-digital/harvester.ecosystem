require 'rails_helper'

RSpec.describe Itms::SyncAllSubjectsJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'syncs all subjects' do
      Itms::Subject.create(itms_id: 1, itms_href: '/v2/subjekty/1')
      Itms::Subject.create(itms_id: 2, itms_href: '/v2/subjekty/2')
      Itms::Subject.create(itms_id: 3, itms_href: '/v2/subjekty/3')

      subject.perform

      expect(Itms::SyncSubjectJob).to have_been_enqueued.exactly(3).times
      expect(Itms::SyncSubjectJob).to have_been_enqueued.with('/v2/subjekty/1')
      expect(Itms::SyncSubjectJob).to have_been_enqueued.with('/v2/subjekty/2')
      expect(Itms::SyncSubjectJob).to have_been_enqueued.with('/v2/subjekty/3')
    end
  end
end
