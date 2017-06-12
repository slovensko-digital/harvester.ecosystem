class Itms::FinishedProjectActivityUnit < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_aktivity_subjekty'

  belongs_to :finished_project_activity
end
