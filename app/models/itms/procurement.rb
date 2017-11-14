class Itms::Procurement < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania'

  belongs_to :druh_zakazky, class_name: Itms::CodelistValue
  belongs_to :hlavny_predmet_hlavny_slovnik, class_name: Itms::CodelistValue
  belongs_to :metoda_vo, class_name: Itms::CodelistValue
  belongs_to :obstaravatel_dodavatel_obstaravatel, class_name: Itms::Supplier
  belongs_to :obstaravatel_subjekt, class_name: Itms::Subject
  belongs_to :postup_obstaravania, class_name: Itms::CodelistValue
  belongs_to :zadavatel, class_name: Itms::Subject

  has_many :verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik,
           class_name: Itms::ProcurementAdditionalSubjectAdditionalDictionary,
           foreign_key: 'verejne_obstaravanie_id'
  has_many :doplnujuce_predmety_doplnkovy_slovnik,
           through: :verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik,
           source: :predmet

  has_many :verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik,
           class_name: Itms::ProcurementAdditionalSubjectMainDictionary,
           foreign_key: 'verejne_obstaravanie_id'
  has_many :doplnujuce_predmety_hlavny_slovnik,
           through: :verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik,
           source: :predmet

  has_many :verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik,
           class_name: Itms::ProcurementMainSubjectAdditionalDictionary,
           foreign_key: 'verejne_obstaravanie_id'
  has_many :hlavny_predmet_doplnkovy_slovnik,
           through: :verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik,
           source: :predmet

  has_many :verejne_obstaravania_operacne_programy,
           class_name: Itms::ProcurementOperationalProgram,
           foreign_key: 'verejne_obstaravanie_id'
  has_many :operacne_programy,
           through: :verejne_obstaravania_operacne_programy,
           source: :operacny_program

  has_many :verejne_obstaravania_projekty,
           class_name: Itms::ProcurementProject,
           foreign_key: 'verejne_obstaravanie_id'
  has_many :projekty,
           through: :verejne_obstaravania_projekty,
           source: :projekt

  has_many :verejne_obstaravania_uctovne_doklady,
           class_name: Itms::ProcurementAccountingDocument,
           foreign_key: 'verejne_obstaravanie_id'
  has_many :uctovne_doklady,
           through: :verejne_obstaravania_uctovne_doklady,
           source: :uctovny_doklad
end
