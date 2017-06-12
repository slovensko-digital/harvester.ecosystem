class Itms::FinishedProjectPartner < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_partneri'

  belongs_to :finished_project
end
