class CreateItmsMonitoringDates < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.monitorovacie_terminy' do |t|
      t.references :projekt, null: false, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.datetime :datum_predlozenia_najneskorsi
      t.integer :poradove_cislo
      t.datetime :termin_monitorovania
      t.string :typ_monitorovacej_spravy

      t.timestamps
    end
  end
end
