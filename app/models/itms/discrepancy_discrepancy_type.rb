class Itms::DiscrepancyDiscrepancyType < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti_typy_nezrovnalosti'

  belongs_to :nezrovnalost, class_name: Itms::Discrepancy
  belongs_to :kod, class_name: Itms::Code
end
