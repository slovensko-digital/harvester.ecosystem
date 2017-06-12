class Itms::FinishedProjectActivity < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_aktivity'

  belongs_to :finished_project
  has_one :finished_project_activity_unit, foreign_key: :projekty_ukoncene_aktivity_id
end
