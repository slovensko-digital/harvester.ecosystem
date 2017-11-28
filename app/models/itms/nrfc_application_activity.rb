class Itms::NrfcApplicationActivity < ApplicationRecord
  self.table_name = 'itms.zonfp_aktivity_projekt'

  belongs_to :subjekt, class_name: 'Itms::Subject'
  belongs_to :typ_aktivity, class_name: 'Itms::ActivityType'
end
