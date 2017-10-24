class Itms::CodeTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.kody_uzemne_mechanizmy'

  def self.find_or_create_by_json(json)
    find_or_create_by!(
        kod_id: json['id'],
        kod_zdroj: json['kodZdroj'],
        nazov: json['nazov']
    )
  end
end
