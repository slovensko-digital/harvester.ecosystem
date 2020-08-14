class Itms::Procurement < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania'

  belongs_to :druh_zakazky, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :hlavny_predmet_hlavny_slovnik, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :metoda_vo, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :obstaravatel_dodavatel_obstaravatel, class_name: 'Itms::Supplier', optional: true
  belongs_to :obstaravatel_subjekt, class_name: 'Itms::Subject', optional: true
  belongs_to :postup_obstaravania, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :zadavatel, class_name: 'Itms::Subject', optional: true

  has_and_belongs_to_many :doplnujuce_predmety_doplnkovy_slovnik,
                          class_name: 'Itms::CodelistValue',
                          join_table: 'itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik',
                          association_foreign_key: :predmet_id,
                          foreign_key: :verejne_obstaravanie_id

  has_and_belongs_to_many :doplnujuce_predmety_hlavny_slovnik,
                          class_name: 'Itms::CodelistValue',
                          join_table: 'itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik',
                          association_foreign_key: :predmet_id,
                          foreign_key: :verejne_obstaravanie_id

  has_and_belongs_to_many :hlavny_predmet_doplnkovy_slovnik,
                          class_name: 'Itms::CodelistValue',
                          join_table: 'itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik',
                          association_foreign_key: :predmet_id,
                          foreign_key: :verejne_obstaravanie_id

  has_and_belongs_to_many :operacne_programy,
                          class_name: 'Itms::OperationalProgram',
                          join_table: 'itms.verejne_obstaravania_operacne_programy',
                          association_foreign_key: :operacny_program_id,
                          foreign_key: :verejne_obstaravanie_id

  has_and_belongs_to_many :projekty,
                          class_name: 'Itms::Project',
                          join_table: 'itms.verejne_obstaravania_projekty',
                          association_foreign_key: :projekt_id,
                          foreign_key: :verejne_obstaravanie_id

  has_and_belongs_to_many :uctovne_doklady,
                          class_name: 'Itms::AccountingDocument',
                          join_table: 'itms.verejne_obstaravania_uctovne_doklady',
                          association_foreign_key: :uctovny_doklad_id,
                          foreign_key: :verejne_obstaravanie_id
end
