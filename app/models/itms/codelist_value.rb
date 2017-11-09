class Itms::CodelistValue < ApplicationRecord
  self.table_name = 'itms.hodnoty_ciselnikov'

  belongs_to :ciselnik, class_name: Itms::Codelist

  scope :where_codelist_and_value, -> (codelist_itms_id, codelist_value_itms_id) {
    joins(:ciselnik)
        .where("#{Itms::Codelist.table_name}" => { ciselnik_kod: codelist_itms_id })
        .where(itms_id: codelist_value_itms_id)
  }
end
