class Metais::ProjectChange < ApplicationRecord
  self.table_name = 'metais.project_changes'

  belongs_to :project_version, class_name: 'Metais::ProjectVersion'
end
