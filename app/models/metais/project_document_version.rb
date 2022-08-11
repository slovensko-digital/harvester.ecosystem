class Metais::ProjectDocumentVersion < ApplicationRecord
  self.table_name = 'metais.verzie_dokumenty_projekty'

  belongs_to :dokument, class_name: 'Metais::ProjectDocument', foreign_key: 'dokument_id'
end
