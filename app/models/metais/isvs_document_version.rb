class Metais::IsvsDocumentVersion < ApplicationRecord
  self.table_name = 'metais.verzie_dokumenty_isvs'

  belongs_to :isvs_document, class_name: 'Metais::IsvsDocument'
end
