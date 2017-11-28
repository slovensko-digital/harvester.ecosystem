class Itms::Discrepancy < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti'

  belongs_to :administrativny_stav, class_name: 'Itms::CodelistValue'
  belongs_to :dlznik, class_name: 'Itms::Subject'
  belongs_to :financny_stav, class_name: 'Itms::CodelistValue'
  belongs_to :hlavny_typ_nezrovnalosti, class_name: 'Itms::CodelistValue'
  belongs_to :konkretny_ciel, class_name: 'Itms::SpecificGoal'
  belongs_to :operacny_program, class_name: 'Itms::OperationalProgram'
  belongs_to :prioritna_os, class_name: 'Itms::PriorityAxis'
  belongs_to :projekt, class_name: 'Itms::Project'

  has_and_belongs_to_many :subjekty_ktore_sposobili_nezrovnalost,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost',
                          association_foreign_key: :subjekt_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :subjekty_ktore_zistili_nezrovnalost,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost',
                          association_foreign_key: :subjekt_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :subjekty_zodpovedne_za_nasledne_konanie,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie',
                          association_foreign_key: :subjekt_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :suvisiace_nezrovnalosti,
                          class_name: 'Itms::Discrepancy',
                          join_table: 'itms.nezrovnalosti_suvisiace_nezrovnalosti',
                          association_foreign_key: :suvisiaca_nezrovnalost_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :suvisiace_pohladavkove_doklady,
                          class_name: 'Itms::AccountsReceivableDocument',
                          join_table: 'itms.nezrovnalosti_suvisiace_pohladavkove_doklady',
                          association_foreign_key: :pohladavkovy_doklad_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :suvisiace_verejne_obstaravania,
                          class_name: 'Itms::Procurement',
                          join_table: 'itms.nezrovnalosti_suvisiace_verejne_obstaravania',
                          association_foreign_key: :verejne_obstaravanie_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :suvisiace_zop,
                          class_name: 'Itms::PaymentClaim',
                          join_table: 'itms.nezrovnalosti_suvisiace_zop',
                          association_foreign_key: :zop_id,
                          foreign_key: :nezrovnalost_id

  has_and_belongs_to_many :typy_nezrovnalosti,
                          class_name: 'Itms::CodelistValue',
                          join_table: 'itms.nezrovnalosti_typy_nezrovnalosti',
                          association_foreign_key: :kod_id,
                          foreign_key: :nezrovnalost_id
end
