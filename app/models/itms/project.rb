class Itms::Project < ApplicationRecord
  self.table_name = 'itms.projekty'

  belongs_to :prijimatel, class_name: Itms::Subject
  has_many :projekty_aktivity,
           class_name: Itms::ProjectProjectActivity,
           foreign_key: 'projekt_id'
  has_many :aktivity,
           through: :projekty_aktivity,
           source: :aktivita
  has_many :projekty_formy_financovania,
           class_name: Itms::ProjectFinancingForm,
           foreign_key: 'projekt_id'
  has_many :formy_financovania,
           through: :projekty_formy_financovania,
           source: :forma_financovania
end
