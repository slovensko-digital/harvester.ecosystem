class Itms::OngoingProjectMeasurableIndicator < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_meratelne_ukazovatele'

  belongs_to :finished_project
end
