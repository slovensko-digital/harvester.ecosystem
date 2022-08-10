class Metais::ProjectDocumentVersion < ApplicationRecord
  self.table_name = 'metais.verzie_dokumenty_projekty'

  belongs_to :project_document, class_name: 'Metais::ProjectDocument'
end
