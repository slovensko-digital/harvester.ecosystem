class Itms::ProjectIndicator < ApplicationRecord
  self.table_name = 'itms.projektove_ukazovatele'

  has_many :projektove_ukazovalele_casy_plnenia,
           class_name: Itms::ProjectIndicatorCompletionTime,
           foreign_key: 'projektovy_ukazovatel_id'
  has_many :cas_plnenia,
           through: :projektove_ukazovalele_casy_plnenia,
           source: :kod
  has_many :projektove_ukazovalele_fondy,
           class_name: Itms::ProjectIndicatorFund,
           foreign_key: 'projektovy_ukazovatel_id'
  has_many :fondy,
           through: :projektove_ukazovalele_fondy,
           source: :kod
end
