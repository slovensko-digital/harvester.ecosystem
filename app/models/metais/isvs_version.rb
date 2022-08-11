class Metais::IsvsVersion < ApplicationRecord
  self.table_name = 'metais.verzie_isvs'

  belongs_to :isvs, class_name: 'Metais::Isvs', foreign_key: 'isvs_id'
end
