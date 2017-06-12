class Itms::RejectedZonfpMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_meratelne_ukazovatele'

  belongs_to :rejected_zonfp
end
