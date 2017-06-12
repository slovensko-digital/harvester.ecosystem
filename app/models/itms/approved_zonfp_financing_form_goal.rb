class Itms::ApprovedZonfpFinancingFormGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_formy_financovania_ciele'

  belongs_to :approved_zonfp_financing_form
end
