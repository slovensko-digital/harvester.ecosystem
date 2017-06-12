class Itms::DeclaredAppealAnnouncer < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_vyhlasovatel'

  belongs_to :declared_appeal
end
