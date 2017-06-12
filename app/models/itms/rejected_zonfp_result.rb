class Itms::RejectedZonfpResult < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_vysledok_konania'

  belongs_to :rejected_zonfp
end
