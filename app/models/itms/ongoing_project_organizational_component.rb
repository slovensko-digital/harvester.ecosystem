class Itms::OngoingProjectOrganizationalComponent < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_organizacne_zlozky'

  belongs_to :ongoing_project
end
