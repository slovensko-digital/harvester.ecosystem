class Itms::SubmittedZopSubmittedFor < ApplicationRecord
  self.table_name = 'itms.zop_predlozene_predkladana_za'

  belongs_to :submitted_zop
end
