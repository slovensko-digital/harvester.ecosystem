class Itms::AnnouncedProposalCallProvider < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_poskytovatelia'

  belongs_to :vyzva, class_name: Itms::AnnouncedProposalCall
  belongs_to :poskytovatel, class_name: Itms::Subject
end