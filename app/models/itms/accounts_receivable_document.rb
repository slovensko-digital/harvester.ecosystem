class Itms::AccountsReceivableDocument < ApplicationRecord
  self.table_name = 'itms.pohladavkove_doklady'

  belongs_to :dlznik, class_name: 'Itms::Subject', optional: true
  belongs_to :dovod_vratenia, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :konkretny_ciel, class_name: 'Itms::SpecificGoal', optional: true
  belongs_to :nezrovnalost, class_name: 'Itms::Discrepancy', optional: true
  belongs_to :prioritna_os, class_name: 'Itms::PriorityAxis', optional: true
  belongs_to :projekt, class_name: 'Itms::Project', optional: true
  belongs_to :subjekt_zodpovedny_za_vymahanie, class_name: 'Itms::Subject', optional: true

  has_and_belongs_to_many :suvisiace_verejne_obstaravania,
                          class_name: 'Itms::Procurement',
                          join_table: 'itms.pohladavkove_doklady_suvisiace_verejne_obstaravania',
                          association_foreign_key: :verejne_obstaravanie_id,
                          foreign_key: :pohladavkovy_doklad_id

  has_and_belongs_to_many :suvisiace_zop,
                          class_name: 'Itms::PaymentClaim',
                          join_table: 'itms.pohladavkove_doklady_suvisiace_zop',
                          association_foreign_key: :zop_id,
                          foreign_key: :pohladavkovy_doklad_id
end
