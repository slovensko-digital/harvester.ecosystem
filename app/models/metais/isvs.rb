class Metais::Isvs < ApplicationRecord
  self.table_name = 'metais.isvs'

  belongs_to :projekt, class_name: 'Metais::Project'
  has_many :dokumenty, class_name: 'Metais::IsvsDocument'
  has_many :versions, class_name: 'Metais::IsvsVersion'
end
  