class Itms::FinishedProjectMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_meratelne_ukazovatele'

  belongs_to :finished_project
end
