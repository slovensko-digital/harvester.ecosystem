class Itms::NrfcApplicationReceivedMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_meratelne_ukazovatele'

  belongs_to :projektovy_ukazovatel, class_name: 'Itms::ProjectIndicator'
end
