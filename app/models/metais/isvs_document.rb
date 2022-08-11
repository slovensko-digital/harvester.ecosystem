class Metais::IsvsDocument < ApplicationRecord
  self.table_name = 'metais.dokumenty_isvs'

  belongs_to :isvs, class_name: 'Metais::Isvs', foreign_key: 'isvs_id'
  has_many :versions, class_name: 'Metais::IsvsDocumentVersion', foreign_key: 'dokument_id'
  belongs_to :latest_version, class_name: 'Metais::IsvsDocumentVersion', foreign_key: 'latest_version_id'
end
  