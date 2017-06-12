class Itms::DeclaredAppealContactPerson < ApplicationRecord
  self.table_name = 'itms.vzvy_vyhlasene_kontaktne_osoby'

  belongs_to :declared_appeal
end
