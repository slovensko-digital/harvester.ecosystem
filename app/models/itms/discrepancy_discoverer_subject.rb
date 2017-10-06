class Itms::DiscrepancyDiscovererSubject < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost'

  belongs_to :nezrovnalost, class_name: Itms::Discrepancy
  belongs_to :subjekt, class_name: Itms::Subject
end
