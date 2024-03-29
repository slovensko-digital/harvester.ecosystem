class Metais::Isvs < ApplicationRecord
  self.table_name = 'metais.isvs'

  belongs_to :project, class_name: 'Metais::Project', foreign_key: 'project_id'
  has_many :documents, class_name: 'Metais::IsvsDocument'
  has_many :versions, class_name: 'Metais::IsvsVersion'
  belongs_to :latest_version, class_name: 'Metais::IsvsVersion', foreign_key: 'latest_version_id', optional: true
end
  