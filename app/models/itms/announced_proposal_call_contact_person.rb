class Itms::AnnouncedProposalCallContactPerson < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene_kontaktne_osoby'

  belongs_to :vyzva, class_name: Itms::AnnouncedProposalCall
  belongs_to :osoba, class_name: Itms::Person
end