class Itms::Discrepancy < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti'

  belongs_to :administrativny_stav, class_name: Itms::Code
  belongs_to :dlznik, class_name: Itms::Subject
  belongs_to :financny_stav, class_name: Itms::Code
  belongs_to :hlavny_typ_nezrovnalosti, class_name: Itms::Code
  belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
  has_many :nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost,
           class_name: Itms::DiscrepancyCauserSubject,
           foreign_key: 'nezrovnalost_id'
  has_many :subjekty_ktore_sposobili_nezrovnalost,
           through: :nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost,
           source: :subjekt
  has_many :nezrovnalosti_subjekty_ktore_zistili_nezrovnalost,
           class_name: Itms::DiscrepancyDiscovererSubject,
           foreign_key: 'nezrovnalost_id'
  has_many :subjekty_ktore_zistili_nezrovnalost,
           through: :nezrovnalosti_subjekty_ktore_zistili_nezrovnalost,
           source: :subjekt
  has_many :nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie,
           class_name: Itms::DiscrepancyResponsibleSubject,
           foreign_key: 'nezrovnalost_id'
  has_many :subjekty_zodpovedne_za_nasledne_konanie,
           through: :nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie,
           source: :subjekt
  has_many :nezrovnalosti_suvisiace_nezrovnalosti,
           class_name: Itms::DiscrepancyRelatedDiscrepancy,
           foreign_key: 'nezrovnalost_id'
  has_many :suvisiace_nezrovnalosti,
           through: :nezrovnalosti_suvisiace_nezrovnalosti,
           source: :suvisiaca_nezrovnalost
  has_many :nezrovnalosti_suvisiace_pohladavkove_doklady,
           class_name: Itms::DiscrepancyRelatedAccountsReceivableDocument,
           foreign_key: 'nezrovnalost_id'
  has_many :suvisiace_pohladavkove_doklady,
           through: :nezrovnalosti_suvisiace_pohladavkove_doklady,
           source: :pohladavkovy_doklad
end
