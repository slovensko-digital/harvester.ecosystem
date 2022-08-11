class Metais::IsvsDocumentVersion < ApplicationRecord
  self.table_name = 'metais.verzie_dokumenty_isvs'

  belongs_to :dokument, class_name: 'Metais::IsvsDocument', foreign_key: 'dokument_id'
end
