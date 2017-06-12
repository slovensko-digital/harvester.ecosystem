class Itms::DeclaredAppealGoal < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_ciele'

  belongs_to :declared_appeal
end
