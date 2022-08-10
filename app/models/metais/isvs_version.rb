class Metais::IsvsVersion < ApplicationRecord
  self.table_name = 'metais.verzie_isvs'

  belongs_to :isvs, class_name: 'Metais::Isvs'
end
