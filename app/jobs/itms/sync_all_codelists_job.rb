class Itms::SyncAllCodelistsJob < ItmsJob
  def perform
    Itms::Codelist.find_each do |codelist|
      Itms::SyncCodelistJob.perform_later(codelist.ciselnik_kod)
    end
  end
end
