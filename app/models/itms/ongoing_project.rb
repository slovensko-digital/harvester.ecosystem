class Itms::OngoingProject < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii'

  has_many :ongoing_project_activities, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_financing_forms, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_economic_activities, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_intensities, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_measurable_indicators, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_realization_places, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_monitoring_dates, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_intervention_areas, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_organizational_components, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_partners, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_territory_types, foreign_key: :projekty_vrealizacii_id
  has_many :ongoing_project_territorial_mechanisms, foreign_key: :projekty_vrealizacii_id
  has_one :ongoing_project_recipient, foreign_key: :projekty_vrealizacii_id
  has_one :ongoing_project_approved_zonfp, foreign_key: :projekty_vrealizacii_id
  has_one :ongoing_project_appeal, foreign_key: :projekty_vrealizacii_id
end
