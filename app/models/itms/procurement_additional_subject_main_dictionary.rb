class Itms::ProcurementAdditionalSubjectMainDictionary < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik'

  belongs_to :verejne_obstaravanie, class_name: Itms::Procurement
  belongs_to :predmet, class_name: Itms::CodelistValue
end
