class Itms::RejectedZonfpFinancingFormGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_formy_financovania_ciele'

  belongs_to :rejected_zonfp_financing_form
end
