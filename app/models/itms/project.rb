class Itms::Project < ApplicationRecord
  self.table_name = 'itms.projekty'

  belongs_to :prijimatel, class_name: Itms::Subject
end
