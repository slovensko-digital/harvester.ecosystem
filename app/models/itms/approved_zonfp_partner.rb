class Itms::ApprovedZonfpPartner < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_partneri'

  belongs_to :approved_zonfp
end
