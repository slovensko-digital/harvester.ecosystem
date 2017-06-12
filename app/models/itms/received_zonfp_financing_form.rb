class Itms::ReceivedZonfpFinancingForm < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_formy_financovania'

  belongs_to :received_zonfp
  has_one :received_zonfp_financing_form_goal, foreign_key: :zonfp_prijate_formy_financovania_id, primary_key: :id
end
