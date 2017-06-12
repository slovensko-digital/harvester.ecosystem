class Itms::FinishedProjectRecipient < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_prijimatel'

  belongs_to :finished_project
end
