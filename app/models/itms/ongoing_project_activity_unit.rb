class Itms::OngoingProjectActivityUnit < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_aktivity_subjekty'

  belongs_to :ongoing_project_activity
end
