class Itms::ProjectPartner < ApplicationRecord
  self.table_name = 'itms.projekty_partneri'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :partner, class_name: Itms::Subject
end
