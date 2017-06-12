class Itms::SubmittedZopProject < ApplicationRecord
  self.table_name = 'itms.zop_predlozene_projekt'

  belongs_to :submitted_zop
end
