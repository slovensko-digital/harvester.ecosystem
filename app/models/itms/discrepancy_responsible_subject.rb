class Itms::DiscrepancyResponsibleSubject < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie'

  belongs_to :nezrovnalost, class_name: Itms::Discrepancy
  belongs_to :subjekt, class_name: Itms::Subject
end
