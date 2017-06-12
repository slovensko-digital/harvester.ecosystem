class Itms::RejectedZonfp < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute'

  has_many :rejected_zonfp_activity_projects, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_financing_forms, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_economic_activities, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_measurable_indicators, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_realization_places, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_intervention_areas, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_organizational_components, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_partners, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_territory_types, foreign_key: :zonfp_zamietnute_id
  has_many :rejected_zonfp_territorial_mechanisms, foreign_key: :zonfp_zamietnute_id
  has_one :rejected_zonfp_appeal, foreign_key: :zonfp_zamietnute_id
  has_one :rejected_zonfp_applicant, foreign_key: :zonfp_zamietnute_id
  has_one :rejected_zonfp_result, foreign_key: :zonfp_zamietnute_id
end
