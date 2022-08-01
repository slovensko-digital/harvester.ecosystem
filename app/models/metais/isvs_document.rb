class Metais::IsvsDocument < ApplicationRecord
  self.table_name = 'metais.dokumenty_isvs'

  has_paper_trail

  belongs_to :isvs, class_name: 'Metais::Isvs'
end
  