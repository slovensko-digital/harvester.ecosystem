class Itms::OngoingProjectMonitoringDate < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_monitorovacie_terminy'

  belongs_to :ongoing_project
end
