class Itms::PlannedProposalCallProvider < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_poskytovatelia'

  belongs_to :vyzva, class_name: Itms::PlannedProposalCall
  belongs_to :poskytovatel, class_name: Itms::Subject
end
