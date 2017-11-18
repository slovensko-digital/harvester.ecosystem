class CreateItmsPaymentClaims < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.zop_predlozene', force: :cascade
    drop_table 'itms.zop_predlozene_predfinancovanie', force: :cascade
    drop_table 'itms.zop_predlozene_predkladana_za', force: :cascade
    drop_table 'itms.zop_predlozene_prijimatel', force: :cascade
    drop_table 'itms.zop_predlozene_projekt', force: :cascade
    drop_table 'itms.zop_uhradene', force: :cascade
    drop_table 'itms.zop_uhradene_predfinancovanie', force: :cascade
    drop_table 'itms.zop_uhradene_predkladana_za', force: :cascade
    drop_table 'itms.zop_uhradene_prijimatel', force: :cascade
    drop_table 'itms.zop_uhradene_projekt', force: :cascade
    drop_table 'itms.zop_zamietnute', force: :cascade
    drop_table 'itms.zop_zamietnute_predfinancovanie', force: :cascade
    drop_table 'itms.zop_zamietnute_predkladana_za', force: :cascade
    drop_table 'itms.zop_zamietnute_prijimatel', force: :cascade
    drop_table 'itms.zop_zamietnute_projekt', force: :cascade

    create_table 'itms.zop' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.datetime :datum_prijatia
      t.datetime :datum_uhrady
      t.datetime :datum_zamietnutia
      t.references :hlavny_cehranicny_partner, foreign_key: { to_table: 'itms.subjekty' }
      t.string :kod
      t.decimal :narokovana_suma
      t.references :predfinancovanie, foreign_key: { to_table: 'itms.zop' }
      t.references :predkladana_za, foreign_key: { to_table: 'itms.subjekty' }
      t.references :prijimatel, foreign_key: { to_table: 'itms.subjekty' }
      t.references :projekt, foreign_key: { to_table: 'itms.projekty' }
      t.decimal :schvalena_suma
      t.string :stav_zamietnutej_zop
      t.string :typ
      t.boolean :vyplaca_sa_partnerovi
      t.boolean :zop_je_zaverecna
      t.boolean :zop_predlozena_za_viac_subjektov
    end

    create_table 'itms.deklarovane_vydavky' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.references :zop, null: false, foreign_key: { to_table: 'itms.zop' }

      t.datetime :datum_uhrady
      t.decimal :dph
      t.string :druh_vydavku
      t.string :ekonomicka_klasifikacia
      t.string :funkcna_klasifikacia
      t.integer :id_polozky_dokladu
      t.string :investicna_akcia_pj
      t.string :investicna_akcia_prijimatela
      t.string :nazov
      t.references :polozka_rozpoctu, foreign_key: { to_table: 'itms.polozky_rozpoctu' }
      t.integer :poradove_cislo
      t.decimal :suma_ziadana_na_preplatenie
      t.decimal :suma_schvalena_na_preplatenie
      t.string :typ_vydavku
      t.references :uctovny_doklad, foreign_key: { to_table: 'itms.uctovne_doklady' }
      t.references :verejne_obstaravanie,
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.decimal :vyska_bez_dph
      t.references :zmluva_verejne_obstaravanie,
                   foreign_key: { to_table: 'itms.zmluvy_verejne_obstaravania' },
                   index: { name: 'index_itms.deklarovane_vydavky_on_zmluva_vo_id'}
    end

    create_table 'itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie' do |t|
      t.references :deklarovany_vydavok,
                   null: false,
                   foreign_key: { to_table: 'itms.deklarovane_vydavky' },
                   index: { name: 'index_itms.deklarovane_vydavky_sumy_neziadane_dv'}

      t.string :druh_neziadanej_sumy, index: { name: 'index_itms.deklarovane_vydavky_sumy_neziadane_dns'}
      t.decimal :suma_neziadana, index: { name: 'index_itms.deklarovane_vydavky_sumy_neziadane_sn'}
    end

    create_table 'itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie' do |t|
      t.references :deklarovany_vydavok,
                   null: false,
                   foreign_key: { to_table: 'itms.deklarovane_vydavky' },
                   index: { name: 'index_itms.deklarovane_vydavky_sumy_neschvalene_dv'}

      t.string :druh_neschvalenej_sumy, index: { name: 'index_itms.deklarovane_vydavky_sumy_neschvalene_dns'}
      t.decimal :suma_neschvalena, index: { name: 'index_itms.deklarovane_vydavky_sumy_neschvalene_sn'}
    end
  end
end
