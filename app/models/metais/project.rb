class Metais::Project < ApplicationRecord
  self.table_name = 'metais.projekty'

  has_many :isvs, class_name: 'Metais::Isvs'
  has_many :dokumenty, class_name: 'Metais::ProjectDocument'
  has_many :versions, class_name: 'Metais::ProjectVersion'
end
