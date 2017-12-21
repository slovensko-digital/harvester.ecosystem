class ItmsAddTimestampsToZmluvyVerejneObstaravania < ActiveRecord::Migration[5.0]
  def change
    add_timestamps 'itms.zmluvy_verejne_obstaravania'
  end
end
