class Itms::PlannedProposalCallAdditionalInfo < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_doplnujuce_info'

  belongs_to :vyzva, class_name: 'Itms::PlannedProposalCall'
end
