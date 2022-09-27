class Metais::ProjectVersion < ApplicationRecord
  self.table_name = 'metais.project_versions'

  belongs_to :project, class_name: 'Metais::Project', foreign_key: 'project_id'

  def previous
    Metais::ProjectVersion.where("project_id = ? AND created_at < ?", project.id, created_at)
    .order(created_at: :desc)
    .limit(1).first
  end
end
