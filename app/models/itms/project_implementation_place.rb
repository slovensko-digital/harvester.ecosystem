class Itms::ProjectImplementationPlace < ApplicationRecord
  self.table_name = 'itms.projekty_miesta_realizacie'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :miesto_realizacie, class_name: Itms::ImplementationPlace
end
