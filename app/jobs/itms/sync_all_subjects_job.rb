class Itms::SyncAllSubjectsJob < ItmsJob
  def perform
    Itms::Subject.find_each do |subject|
      Itms::SyncSubjectJob.perform_later(subject.itms_href)
    end
  end
end
