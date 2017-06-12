class Itms::ReceivedZonfpActivityProjectUnit < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_aktivity_projekt_subjekty'

  belongs_to :received_zonfp_activity_project
end
