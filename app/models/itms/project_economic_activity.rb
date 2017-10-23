class Itms::ProjectEconomicActivity < ApplicationRecord
  self.table_name = 'itms.projekty_hospodarske_cinnosti'

  belongs_to :hospodarska_cinnost, class_name: Itms::SpecificGoalCode
end
