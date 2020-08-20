class Itms::NrfcApplicationReceivedActivity < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_aktivity_projekt'

  belongs_to :subjekt, class_name: 'Itms::Subject', optional: true
  belongs_to :typ_aktivity, class_name: 'Itms::ActivityType', optional: true
end
