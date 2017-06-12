class Itms::OngoingProjectPartner < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_partneri'

  belongs_to :ongoing_project
end
