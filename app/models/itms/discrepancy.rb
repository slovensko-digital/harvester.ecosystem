class Itms::Discrepancy < ApplicationRecord
  self.table_name = 'itms.nezrovnalosti'

  belongs_to :administrativny_stav, class_name: Itms::Code
  belongs_to :financny_stav, class_name: Itms::Code
  belongs_to :hlavny_typ_nezrovnalosti, class_name: Itms::Code
end
