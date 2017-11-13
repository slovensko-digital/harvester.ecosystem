class Itms::ProjectOrganisationalUnit < ApplicationRecord
  self.table_name = 'itms.projekty_organizacne_zlozky'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :organizacna_zlozka, class_name: Itms::OrganisationalUnit
end
