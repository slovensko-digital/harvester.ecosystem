class Itms::MonitoringDate < ApplicationRecord
  self.table_name = 'itms.monitorovacie_terminy'

  belongs_to :projekt, class_name: 'Itms::Project', optional: true
end
