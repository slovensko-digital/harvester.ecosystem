class Itms::ApprovedZonfpApplicant < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_ziadatel'

  belongs_to :approved_zonfp
end
