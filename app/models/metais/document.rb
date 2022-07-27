class Metais::Document < ApplicationRecord
  self.table_name = 'metais.dokumenty'

  has_paper_trail

  belongs_to :attachable, polymorphic: true
end
  