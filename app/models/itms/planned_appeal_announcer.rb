class Itms::PlannedAppealAnnouncer < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_vyhlasovatel'

  belongs_to :planned_appeal
end
