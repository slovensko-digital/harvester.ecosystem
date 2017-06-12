class Itms::RejectedZonfpOrganizationalComponent < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_organizacne_zlozky'

  belongs_to :rejected_zonfp
end
