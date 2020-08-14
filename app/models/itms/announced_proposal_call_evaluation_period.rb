class Itms::AnnouncedProposalCallEvaluationPeriod < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_posudzovane_obdobia'

  belongs_to :vyzva, class_name: 'Itms::AnnouncedProposalCall', optional: true
end
