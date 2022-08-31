class Metais::IsvsDocument < ApplicationRecord
  self.table_name = 'metais.isvs_documents'

  belongs_to :isvs, class_name: 'Metais::Isvs', foreign_key: 'isvs_id'
  has_many :versions, class_name: 'Metais::IsvsDocumentVersion', foreign_key: 'document_id'
  belongs_to :latest_version, class_name: 'Metais::IsvsDocumentVersion', foreign_key: 'latest_version_id'
end
  