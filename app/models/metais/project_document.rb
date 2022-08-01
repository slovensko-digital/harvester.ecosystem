class Metais::ProjectDocument < ApplicationRecord
  self.table_name = 'metais.dokumenty_projekty'

  has_paper_trail

  belongs_to :projekt, class_name: 'Metais::Project'
end
  