class Itms::DeclaredAppealProvider < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_poskytovatelia'

  belongs_to :declared_appeal
end
