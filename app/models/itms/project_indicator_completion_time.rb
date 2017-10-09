class Itms::ProjectIndicatorCompletionTime < ApplicationRecord
  self.table_name = 'itms.projektove_ukazovatele_casy_plnenia'

  belongs_to :projektovy_ukazovatel, class_name: Itms::ProjectIndicator
  belongs_to :kod, class_name: Itms::Code
end
