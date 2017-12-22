class ItmsAddTimestampsToZmluvyVerejneObstaravania < ActiveRecord::Migration[5.0]
  def change
    add_timestamps 'itms.zmluvy_verejne_obstaravania', null: true
    execute "UPDATE itms.zmluvy_verejne_obstaravania SET created_at=now(), updated_at=now()"
    change_column 'itms.zmluvy_verejne_obstaravania', :created_at, :timestamp, null: false
    change_column 'itms.zmluvy_verejne_obstaravania', :updated_at, :timestamp, null: false
  end
end
