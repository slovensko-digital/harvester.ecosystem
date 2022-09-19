class Metais::ProjectVersion < ApplicationRecord
  self.table_name = 'metais.project_versions'

  belongs_to :project, class_name: 'Metais::Project', foreign_key: 'project_id'

  scope :previous, -> (version) { 
    where("project_id = ? AND created_at < ?", version.project.id, version.created_at)
    .order(created_at: :desc)
    .limit(1)
  }
end
