class Itms::DeclaredAppealFund < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_fondy'

  belongs_to :declared_appeal
end
