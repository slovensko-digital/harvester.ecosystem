class Itms::ApprovedZonfpFinancingForm < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_formy_financovania'

  belongs_to :approved_zonfp
  has_one :approved_zonfp_financing_form_goal, foreign_key: :zonfp_schvalene_formy_financovania_id, primary_key: :id
end
