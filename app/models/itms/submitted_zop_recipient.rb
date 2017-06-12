class Itms::SubmittedZopRecipient < ApplicationRecord
  self.table_name = 'itms.zop_predlozene_prijimatel'

  belongs_to :submitted_zop
end
