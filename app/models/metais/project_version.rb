class Metais::ProjectVersion < ApplicationRecord
  self.table_name = 'metais.project_versions'

  belongs_to :project, class_name: 'Metais::Project', foreign_key: 'project_id'

  scope :previous, -> (version) { version.project.versions.where("created_at < ?", version.created_at).order(created_at: :desc).first }
end
