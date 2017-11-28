class Itms::AnnouncedProposalCallAdditionalInfo < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_doplnujuce_info'

  belongs_to :vyzva, class_name: 'Itms::AnnouncedProposalCall'
end
