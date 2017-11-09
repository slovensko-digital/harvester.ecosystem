class Itms::ProjectIndicatorFund < ApplicationRecord
  self.table_name = 'itms.projektove_ukazovatele_fondy'

  belongs_to :projektovy_ukazovatel, class_name: Itms::ProjectIndicator
  belongs_to :kod, class_name: Itms::CodelistValue
end
