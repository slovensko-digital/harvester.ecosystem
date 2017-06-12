class Itms::FinishedProjectMonitoringDate < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_monitorovacie_terminy'

  belongs_to :finished_project
end
