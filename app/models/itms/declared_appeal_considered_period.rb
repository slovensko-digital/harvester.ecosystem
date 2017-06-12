class Itms::DeclaredAppealConsideredPeriod < ApplicationRecord
  self.table_name = 'itms.vzvy_vyhlasene_posudzovane_obdobia'

  belongs_to :declared_appeal
end
