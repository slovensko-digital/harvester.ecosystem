class Metais::ProjectDocument < ApplicationRecord
  self.table_name = 'metais.dokumenty_projekty'

  belongs_to :projekt, class_name: 'Metais::Project', foreign_key: 'projekt_id'
  has_many :versions, class_name: 'Metais::ProjectDocumentVersion', foreign_key: 'dokument_id'
  belongs_to :latest_version, class_name: 'Metais::ProjectDocumentVersion', foreign_key: 'latest_version_id'
end
  