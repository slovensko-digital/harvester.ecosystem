class Itms::NrfcApplicationMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.zonfp_meratelne_ukazovatele'

  belongs_to :zonfp, class_name: 'Itms::NrfcApplication'
  belongs_to :projektovy_ukazovatel, class_name: 'Itms::ProjectIndicator'
end
