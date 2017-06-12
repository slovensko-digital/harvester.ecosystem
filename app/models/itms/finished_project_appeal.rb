class Itms::FinishedProjectAppeal < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_vyzva'

  belongs_to :finished_project
end
