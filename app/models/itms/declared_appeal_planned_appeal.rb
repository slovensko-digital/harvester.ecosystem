class Itms::DeclaredAppealPlannedAppeal < ApplicationRecord
  self.table_name = 'itms.vzvy_vyhlasene_planovane_vyzvy'

  belongs_to :declared_appeal
end
