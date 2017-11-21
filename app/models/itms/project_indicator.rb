class Itms::ProjectIndicator < ApplicationRecord
  self.table_name = 'itms.projektove_ukazovatele'

  has_and_belongs_to_many :cas_plnenia,
                          class_name: Itms::CodelistValue,
                          join_table: 'itms.projektove_ukazovatele_casy_plnenia',
                          association_foreign_key: :kod_id,
                          foreign_key: :projektovy_ukazovatel_id

  has_and_belongs_to_many :fondy,
                          class_name: Itms::CodelistValue,
                          join_table: 'itms.projektove_ukazovatele_fondy',
                          association_foreign_key: :kod_id,
                          foreign_key: :projektovy_ukazovatel_id
end
