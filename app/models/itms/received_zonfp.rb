class Itms::ReceivedZonfp < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate'

  has_many :received_zonfp_activity_projects, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_financing_forms, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_economic_activities, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_measurable_indicators, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_realization_places, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_intervention_areas, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_organizational_components, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_partners, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_territory_types, foreign_key: :zonfp_prijate_id
  has_many :received_zonfp_territorial_mechanisms, foreign_key: :zonfp_prijate_id
  has_one :received_zonfp_appeal, foreign_key: :zonfp_prijate_id
  has_one :received_zonfp_applicant, foreign_key: :zonfp_prijate_id
end
