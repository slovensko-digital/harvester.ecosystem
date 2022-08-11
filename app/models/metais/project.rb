class Metais::Project < ApplicationRecord
  self.table_name = 'metais.projekty'

  has_many :isvs, class_name: 'Metais::Isvs', foreign_key: 'projekt_id'
  has_many :dokumenty, class_name: 'Metais::ProjectDocument', foreign_key: 'projekt_id'
  has_many :versions, class_name: 'Metais::ProjectVersion', foreign_key: 'projekt_id'
  belongs_to :latest_version, class_name: 'Metais::ProjectVersion', foreign_key: 'latest_version_id'
end
