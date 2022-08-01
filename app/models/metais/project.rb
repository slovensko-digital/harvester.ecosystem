class Metais::Project < ApplicationRecord
  self.table_name = 'metais.projekty'

  has_paper_trail

  has_many :isvs, class_name: 'Metais::Isvs', foreign_key: 'projekt_id'
  has_many :dokumenty, class_name: 'Metais::ProjectDocument', foreign_key: 'projekt_id'
end
