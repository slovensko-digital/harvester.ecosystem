class Itms::AnnouncedProposalCallSpecificGoalActivityType < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit'

  belongs_to :vyzva, class_name: 'Itms::AnnouncedProposalCall'
  belongs_to :konkretny_ciel, class_name: 'Itms::SpecificGoal'
  belongs_to :typ_aktivity, class_name: 'Itms::ActivityType'
end
