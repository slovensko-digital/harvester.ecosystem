class Itms::ReceivedZonfpOrganizationalComponent < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_organizacne_zlozky'

  belongs_to :received_zonfp
end
