class Itms::RejectedZonfpFinancingForm < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_formy_financovania'

  belongs_to :rejected_zonfp
  has_one :rejected_zonfp_financing_form_goal, foreign_key: :zonfp_zamietnute_formy_financovania_id, primary_key: :id
end
