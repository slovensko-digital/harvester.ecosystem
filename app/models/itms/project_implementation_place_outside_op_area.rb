class Itms::ProjectImplementationPlaceOutsideOpArea < ApplicationRecord
  self.table_name = 'itms.projekty_miesta_realizacie_mimo_uzemia_op'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :miesto_realizacie, class_name: Itms::ImplementationPlace
end
