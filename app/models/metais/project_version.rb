class Metais::ProjectVersion < ApplicationRecord
  self.table_name = 'metais.verzie_projekty'

  belongs_to :project, class_name: 'Metais::Project'
end
