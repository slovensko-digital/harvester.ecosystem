class Itms::ProjectProjectActivity < ApplicationRecord
  self.table_name = 'itms.projekty_aktivity'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :aktivita, class_name: Itms::ProjectActivity
end
