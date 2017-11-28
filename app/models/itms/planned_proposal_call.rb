class Itms::PlannedProposalCall < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane'

  belongs_to :vyhlasovatel, class_name: 'Itms::Subject'

  has_many :doplnujuce_info,
           class_name: 'Itms::PlannedProposalCallAdditionalInfo',
           foreign_key: 'vyzva_id',
           dependent: :destroy

  has_and_belongs_to_many :konkretne_ciele,
                          class_name: 'Itms::SpecificGoal',
                          join_table: 'itms.vyzvy_planovane_konkretne_ciele',
                          association_foreign_key: :konkretny_ciel_id,
                          foreign_key: :vyzva_id

  has_and_belongs_to_many :poskytovatelia,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.vyzvy_planovane_poskytovatelia',
                          association_foreign_key: :poskytovatel_id,
                          foreign_key: :vyzva_id
end
