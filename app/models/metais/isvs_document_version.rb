class Metais::IsvsDocumentVersion < ApplicationRecord
  self.table_name = 'metais.isvs_document_versions'

  belongs_to :document, class_name: 'Metais::IsvsDocument', foreign_key: 'document_id'
end
