class Metais::ProjectVersion < ApplicationRecord
  self.table_name = 'metais.verzie_projekty'

  belongs_to :projekt, class_name: 'Metais::Project', foreign_key: 'projekt_id'
end
