class Itms::SyncAllCodelistValuesJob < ItmsJob
  def perform
    Itms::CodelistValue.find_each do |codelist_value|
      Itms::SyncCodelistValueJob.perform_later(codelist_value.itms_href)
    end
  end
end
