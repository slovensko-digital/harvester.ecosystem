class Metais::IsvsDocument < ApplicationRecord
  self.table_name = 'metais.dokumenty_isvs'

  belongs_to :isvs, class_name: 'Metais::Isvs'
  has_many :versions, class_name: 'Metais::IsvsDocumentVersion'
end
  