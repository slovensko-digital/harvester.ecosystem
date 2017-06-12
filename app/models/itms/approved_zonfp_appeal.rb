class Itms::ApprovedZonfpAppeal < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_vyzvy'

  belongs_to :approved_zonfp
end
