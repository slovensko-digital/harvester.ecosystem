class Itms::DiscrepancyRelatedAccountsReceivableDocument < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti_suvisiace_pohladavkove_doklady'

  belongs_to :nezrovnalost, class_name: Itms::Discrepancy
  belongs_to :pohladavkovy_doklad, class_name: Itms::AccountsReceivableDocument
end
