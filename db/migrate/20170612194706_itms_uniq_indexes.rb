class ItmsUniqIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index 'itms.uctovne_doklady', :itms_identifier, unique: true
    add_index 'itms.zonfp_schvalene', :itms_identifier, unique: true
    add_index 'itms.vyzvy_vyhlasene', :itms_identifier, unique: true
    add_index 'itms.projekty_ukoncene', :itms_identifier, unique: true
    add_index 'itms.projekty_vrealizacii', :itms_identifier, unique: true
    add_index 'itms.operacne_programy', :itms_identifier, unique: true
    add_index 'itms.zop_uhradene', :itms_identifier, unique: true
    add_index 'itms.vyzvy_planovane', :itms_identifier, unique: true
    add_index 'itms.verejne_obstaravania', :itms_identifier, unique: true
    add_index 'itms.zonfp_prijate', :itms_identifier, unique: true
    add_index 'itms.zonfp_zamietnute', :itms_identifier, unique: true
    add_index 'itms.zop_zamietnute', :itms_identifier, unique: true
    add_index 'itms.zop_predlozene', :itms_identifier, unique: true
  end
end
