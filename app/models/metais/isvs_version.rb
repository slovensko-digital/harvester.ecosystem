class Metais::IsvsVersion < ApplicationRecord
  self.table_name = 'metais.isvs_versions'

  belongs_to :isvs, class_name: 'Metais::Isvs', foreign_key: 'isvs_id'
end
