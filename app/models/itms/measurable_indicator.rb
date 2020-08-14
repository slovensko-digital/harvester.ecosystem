class Itms::MeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.projekty_meratelne_ukazovatele'

  belongs_to :projekt, class_name: 'Itms::Project', optional: true
  belongs_to :projektovy_ukazovatel, class_name: 'Itms::ProjectIndicator', optional: true
end
