class Metais::Project < ApplicationRecord
  self.table_name = 'metais.projects'

  has_many :isvs, class_name: 'Metais::Isvs', foreign_key: 'project_id'
  has_many :documents, class_name: 'Metais::ProjectDocument', foreign_key: 'project_id'
  has_many :versions, class_name: 'Metais::ProjectVersion', foreign_key: 'project_id'
  belongs_to :latest_version, class_name: 'Metais::ProjectVersion', foreign_key: 'latest_version_id'
end
