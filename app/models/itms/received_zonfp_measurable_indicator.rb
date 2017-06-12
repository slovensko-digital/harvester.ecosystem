class Itms::ReceivedZonfpMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_meratelne_ukazovatele'

  belongs_to :received_zonfp
end
