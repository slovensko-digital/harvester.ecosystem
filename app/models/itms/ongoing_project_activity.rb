class Itms::OngoingProjectActivity < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_aktivity'

  belongs_to :ongoing_project
  has_one :ongoing_project_activity_unit, foreign_key: :projekty_vrealizacii_aktivity_id
end
