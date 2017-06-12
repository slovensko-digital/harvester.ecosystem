class Itms::DeclaredAppealInfo < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_doplnujuce_info'

  belongs_to :declared_appeal
end
