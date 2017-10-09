class Itms::DiscrepancyRelatedDiscrepancy < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti_suvisiace_nezrovnalosti'

  belongs_to :nezrovnalost, class_name: Itms::Discrepancy
  belongs_to :suvisiaca_nezrovnalost, class_name: Itms::Discrepancy
end
