class Itms::ProcurementMainVocabulary < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_hlavny_predmet_hlavny_slovniky'

  belongs_to :procurement
end
