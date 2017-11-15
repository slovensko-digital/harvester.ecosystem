class Itms::AnnouncedProposalCallPlannedProposalCall < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_vyzvy_planovane'

  belongs_to :vyhlasena_vyzva, class_name: Itms::AnnouncedProposalCall
  belongs_to :planovana_vyzva, class_name: Itms::PlannedProposalCall
end