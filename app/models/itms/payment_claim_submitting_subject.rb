class Itms::PaymentClaimSubmittingSubject < ApplicationRecord
  self.table_name = 'itms.zop_predkladane_za_subjekty'

  belongs_to :subjekt, class_name: Itms::Subject
end
