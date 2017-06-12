class Itms::ApprovedZonfpEvaluator < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_hodnotitelia'

  belongs_to :approved_zonfp
end
