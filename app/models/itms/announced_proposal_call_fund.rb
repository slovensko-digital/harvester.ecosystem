class Itms::AnnouncedProposalCallFund < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_fondy'

  belongs_to :vyzva, class_name: Itms::AnnouncedProposalCall
  belongs_to :fond, class_name: Itms::CodelistValue
end