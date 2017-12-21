class ChangeIndicesOnZonfpPolozkyRozpoctu < ActiveRecord::Migration[5.0]
  def change
    execute 'DROP INDEX itms."index_itms.zonfp_prijate_polozky_rozpoctu_on_itms_id"'
    execute 'DROP INDEX itms."index_itms.zonfp_polozky_rozpoctu_on_itms_id"'

    add_index 'itms.zonfp_prijate_polozky_rozpoctu', :itms_id
    add_index 'itms.zonfp_spracovane_polozky_rozpoctu', :itms_id

    add_index 'itms.zonfp_prijate_polozky_rozpoctu',
              [:zonfp_id, :itms_id],
              name: 'index_itms.zonfp_prijate_polozky_rozpoctu_on_z_and_pr',
              unique: true

    add_index 'itms.zonfp_spracovane_polozky_rozpoctu',
              [:zonfp_id, :itms_id],
              name: 'index_itms.zonfp_spracovane_polozky_rozpoctu_on_z_and_pr',
              unique: true
  end
end
