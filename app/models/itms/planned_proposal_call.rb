class Itms::PlannedProposalCall < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane'

  belongs_to :vyhlasovatel, class_name: Itms::Subject

  has_many :doplnujuce_info,
           class_name: Itms::PlannedProposalCallAdditionalInfo,
           foreign_key: 'vyzva_id'

  has_many :vyzvy_planovane_konkretne_ciele,
           class_name: Itms::PlannedProposalCallSpecificGoal,
           foreign_key: 'vyzva_id'
  has_many :konkretne_ciele,
           through: :vyzvy_planovane_konkretne_ciele,
           source: :konkretny_ciel

  has_many :vyzvy_planovane_poskytovatelia,
           class_name: Itms::PlannedProposalCallProvider,
           foreign_key: 'vyzva_id'
  has_many :poskytovatelia,
           through: :vyzvy_planovane_poskytovatelia,
           source: :poskytovatel
end
