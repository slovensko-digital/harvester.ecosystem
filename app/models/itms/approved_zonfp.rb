class Itms::ApprovedZonfp < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene'

  has_many :approved_zonfp_activity_projects, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_financing_forms, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_economic_activities, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_measurable_indicators, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_realization_places, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_intervention_areas, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_organizational_components, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_partners, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_territory_types, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_territorial_mechanisms, foreign_key: :zonfp_schvalene_id
  has_many :approved_zonfp_evaluators, foreign_key: :zonfp_schvalene_id
  has_one :approved_zonfp_appeal, foreign_key: :zonfp_schvalene_id
  has_one :approved_zonfp_applicant, foreign_key: :zonfp_schvalene_id
end
