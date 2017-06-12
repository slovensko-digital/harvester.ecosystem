class Itms::FinishedProjectOrganizationalComponent < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_organizacne_zlozky'

  belongs_to :finished_project
end
