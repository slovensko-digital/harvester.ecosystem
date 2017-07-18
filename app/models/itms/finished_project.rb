class Itms::FinishedProject < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene'

  has_many :finished_project_activities, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_financing_forms, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_economic_activities, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_intensities, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_measurable_indicators, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_realization_places, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_monitoring_dates, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_intervention_areas, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_organizational_components, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_partners, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_territory_types, foreign_key: :projekty_ukoncene_id
  has_many :finished_project_territorial_mechanisms, foreign_key: :projekty_ukoncene_id
  has_one :finished_project_recipient, foreign_key: :projekty_ukoncene_id
  has_one :finished_project_approved_zonfp, foreign_key: :projekty_ukoncene_id
  has_one :finished_project_appeal, foreign_key: :projekty_ukoncene_id
end
