class Itms::ApprovedZonfpMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_meratelne_ukazovatele'

  belongs_to :approved_zonfp
end
