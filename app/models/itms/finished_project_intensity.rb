class Itms::FinishedProjectIntensity < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_intenzity'

  belongs_to :finished_project
  has_many :finished_project_intensity_sources, foreign_key: :projekty_ukoncene_intenzity_id, primary_key: :id
  has_one :finished_project_intensity_unit, foreign_key: :projekty_ukoncene_intenzity_id, primary_key: :id
end
