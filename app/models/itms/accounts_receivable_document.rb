class Itms::AccountsReceivableDocument < ApplicationRecord
  self.table_name = 'itms.pohladavkove_doklady'

  belongs_to :dlznik, class_name: Itms::Subject
  belongs_to :dovod_vratenia, class_name: Itms::Code
  belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
  belongs_to :nezrovnalost, class_name: Itms::Discrepancy
  belongs_to :subjekt_zodpovedny_za_vymahanie, class_name: Itms::Subject
end