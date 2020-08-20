class Itms::SpecificGoal < ApplicationRecord
  self.table_name = 'itms.konkretne_ciele'

  belongs_to :fond, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :kategoria_regionov, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :prioritna_os, class_name: 'Itms::PriorityAxis', optional: true

  has_and_belongs_to_many :typy_aktivit,
                          class_name: 'Itms::ActivityType',
                          join_table: 'itms.konkretne_ciele_typy_aktivit',
                          association_foreign_key: :typ_aktivity_id,
                          foreign_key: :konkretny_ciel_id
end
