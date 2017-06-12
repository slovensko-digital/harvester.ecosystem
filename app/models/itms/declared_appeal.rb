class Itms::DeclaredAppeal < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene'

  has_many :declared_appeal_info, foreign_key: :vyzvy_vyhlasene_id
  has_many :declared_appeal_goals, foreign_key: :vyzvy_vyhlasene_id
  has_many :declared_appeal_providers, foreign_key: :vyzvy_vyhlasene_id
  has_many :declared_appeal_funds, foreign_key: :vyzvy_vyhlasene_id
  has_many :declared_appeal_contact_persons, foreign_key: :vyzvy_vyhlasene_id
  has_many :declared_appeal_planned_appeals, foreign_key: :vyzvy_vyhlasene_id
  has_many :declared_appeal_considered_periods, foreign_key: :vyzvy_vyhlasene_id
  has_one :declared_appeal_announcer, foreign_key: :vyzvy_vyhlasene_id
end
