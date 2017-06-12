class Itms::ApprovedZonfpOrganizationalComponent < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_organizacne_zlozky'

  belongs_to :approved_zonfp
end
