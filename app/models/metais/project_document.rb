class Metais::ProjectDocument < ApplicationRecord
  self.table_name = 'metais.dokumenty_projekty'

  belongs_to :projekt, class_name: 'Metais::Project'
  has_many :versions, class_name: 'Metais::ProjectDocumentVersion'
end
  