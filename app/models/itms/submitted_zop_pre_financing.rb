class Itms::SubmittedZopPreFinancing < ApplicationRecord
  self.table_name = 'itms.zop_predlozene_predfinancovanie'

  belongs_to :submitted_zop
end
