class Itms::RejectedZonfpActivityProjectUnit < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_aktivity_projekt_subjekty'

  belongs_to :rejected_zonfp_activity_project
end
