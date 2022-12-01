class Metais::ProjectDocument < ApplicationRecord
  self.table_name = 'metais.project_documents'

  belongs_to :project, class_name: 'Metais::Project', foreign_key: 'project_id'
  has_many :versions, class_name: 'Metais::ProjectDocumentVersion', foreign_key: 'document_id'
  belongs_to :latest_version, class_name: 'Metais::ProjectDocumentVersion', foreign_key: 'latest_version_id', optional: true
end
  