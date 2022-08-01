class Metais::Isvs < ApplicationRecord
  self.table_name = 'metais.isvs'

  has_paper_trail

  belongs_to :projekt, class_name: 'Metais::Project'
  has_many :dokumenty, class_name: 'Metais::IsvsDocument'
end
  