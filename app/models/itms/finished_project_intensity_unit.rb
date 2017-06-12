class Itms::FinishedProjectIntensityUnit < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_intenzity_subjekty'

  belongs_to :finished_project_intensity
end
