class Itms::ReceivedZonfpFinancingFormGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_formy_financovania_ciele'

  belongs_to :received_zonfp_financing_form
end
