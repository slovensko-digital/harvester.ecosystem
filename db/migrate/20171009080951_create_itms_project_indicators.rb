class CreateItmsProjectIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.projektove_ukazovatele' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.string :definicia
      t.boolean :evidencia_podla_pohlavia
      t.string :kod
      t.string :merna_jednotka
      t.string :nazov
      t.boolean :platnost
      t.string :typ_vypoctu

      t.timestamps
    end

    create_table 'itms.projektove_ukazovatele_casy_plnenia' do |t|
      t.references :projektovy_ukazovatel, index: { name: 'index_itms.projektove_ukazovatele_casy_plnenia_ukazovatel' }, foreign_key: { to_table: 'itms.projektove_ukazovatele' }
      t.references :kod, index: { name: 'index_itms.projektove_ukazovatele_casy_plnenia_cas' }, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end

    create_table 'itms.projektove_ukazovatele_fondy' do |t|
      t.references :projektovy_ukazovatel, index: { name: 'index_itms.projektove_ukazovatele_fondy_ukazovatel' }, foreign_key: { to_table: 'itms.projektove_ukazovatele' }
      t.references :kod, index: { name: 'index_itms.projektove_ukazovatele_fondy_fond' }, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
  end
end
