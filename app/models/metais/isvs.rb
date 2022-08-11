class Metais::Isvs < ApplicationRecord
  self.table_name = 'metais.isvs'

  belongs_to :projekt, class_name: 'Metais::Project', foreign_key: 'projekt_id'
  has_many :dokumenty, class_name: 'Metais::IsvsDocument'
  has_many :versions, class_name: 'Metais::IsvsVersion'
  belongs_to :latest_version, class_name: 'Metais::IsvsVersion', foreign_key: 'latest_version_id'
end
  