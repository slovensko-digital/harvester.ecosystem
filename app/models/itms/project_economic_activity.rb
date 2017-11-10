class Itms::ProjectEconomicActivity < ApplicationRecord
  include Itms::ProjectGoalCodelist

  self.table_name = 'itms.projekty_hospodarske_cinnosti'
end
