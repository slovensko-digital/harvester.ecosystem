class Itms::ProcurementAdditionalVocabulary < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky'

  belongs_to :procurement
end
