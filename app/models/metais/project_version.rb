class Metais::ProjectVersion < ApplicationRecord
  self.table_name = 'metais.project_versions'

  belongs_to :project, class_name: 'Metais::Project', foreign_key: 'project_id'
end
