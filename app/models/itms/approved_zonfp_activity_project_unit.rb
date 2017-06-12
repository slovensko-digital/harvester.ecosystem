class Itms::ApprovedZonfpActivityProjectUnit < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_aktivity_projekt_subjekty'

  belongs_to :approved_zonfp_activity_project
end
