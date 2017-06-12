class Itms::OngoingProjectAppeal < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_vyzva'

  belongs_to :ongoing_project
end
