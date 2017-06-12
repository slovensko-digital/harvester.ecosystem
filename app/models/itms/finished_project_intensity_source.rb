class Itms::FinishedProjectIntensitySource < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_intenzity_zdroje'

  belongs_to :finished_project_intensity
end
