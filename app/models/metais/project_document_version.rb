class Metais::ProjectDocumentVersion < ApplicationRecord
  self.table_name = 'metais.project_document_versions'

  belongs_to :document, class_name: 'Metais::ProjectDocument', foreign_key: 'document_id'
end
