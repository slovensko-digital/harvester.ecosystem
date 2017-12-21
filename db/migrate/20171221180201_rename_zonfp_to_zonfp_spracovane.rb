class RenameZonfpToZonfpSpracovane < ActiveRecord::Migration[5.0]
  def up
    execute 'ALTER TABLE itms.zonfp RENAME TO zonfp_spracovane'
    execute 'ALTER TABLE itms.zonfp_aktivity_projekt RENAME TO zonfp_spracovane_aktivity_projekt'
    execute 'ALTER TABLE itms.zonfp_formy_financovania RENAME TO zonfp_spracovane_formy_financovania'
    execute 'ALTER TABLE itms.zonfp_hodnotitelia RENAME TO zonfp_spracovane_hodnotitelia'
    execute 'ALTER TABLE itms.zonfp_hospodarske_cinnosti RENAME TO zonfp_spracovane_hospodarske_cinnosti'
    execute 'ALTER TABLE itms.zonfp_meratelne_ukazovatele RENAME TO zonfp_spracovane_meratelne_ukazovatele'
    execute 'ALTER TABLE itms.zonfp_miesta_realizacie RENAME TO zonfp_spracovane_miesta_realizacie'
    execute 'ALTER TABLE itms.zonfp_miesta_realizacie_mimo_uzemia_op RENAME TO zonfp_spracovane_miesta_realizacie_mimo_uzemia_op'
    execute 'ALTER TABLE itms.zonfp_oblasti_intervencie RENAME TO zonfp_spracovane_oblasti_intervencie'
    execute 'ALTER TABLE itms.zonfp_organizacne_zlozky RENAME TO zonfp_spracovane_organizacne_zlozky'
    execute 'ALTER TABLE itms.zonfp_partneri RENAME TO zonfp_spracovane_partneri'
    execute 'ALTER TABLE itms.zonfp_polozky_rozpoctu RENAME TO zonfp_spracovane_polozky_rozpoctu'
    execute 'ALTER TABLE itms.zonfp_sekundarne_tematicke_okruhy RENAME TO zonfp_spracovane_sekundarne_tematicke_okruhy'
    execute 'ALTER TABLE itms.zonfp_typy_uzemia RENAME TO zonfp_spracovane_typy_uzemia'
    execute 'ALTER TABLE itms.zonfp_uzemne_mechanizmy RENAME TO zonfp_spracovane_uzemne_mechanizmy'
  end

  def down
    execute 'ALTER TABLE itms.zonfp_spracovane RENAME TO zonfp'
    execute 'ALTER TABLE itms.zonfp_spracovane_aktivity_projekt RENAME TO zonfp_aktivity_projekt'
    execute 'ALTER TABLE itms.zonfp_spracovane_formy_financovania RENAME TO zonfp_formy_financovania'
    execute 'ALTER TABLE itms.zonfp_spracovane_hodnotitelia RENAME TO zonfp_hodnotitelia'
    execute 'ALTER TABLE itms.zonfp_spracovane_hospodarske_cinnosti RENAME TO zonfp_hospodarske_cinnosti'
    execute 'ALTER TABLE itms.zonfp_spracovane_meratelne_ukazovatele RENAME TO zonfp_meratelne_ukazovatele'
    execute 'ALTER TABLE itms.zonfp_spracovane_miesta_realizacie RENAME TO zonfp_miesta_realizacie'
    execute 'ALTER TABLE itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op RENAME TO zonfp_miesta_realizacie_mimo_uzemia_op'
    execute 'ALTER TABLE itms.zonfp_spracovane_oblasti_intervencie RENAME TO zonfp_oblasti_intervencie'
    execute 'ALTER TABLE itms.zonfp_spracovane_organizacne_zlozky RENAME TO zonfp_organizacne_zlozky'
    execute 'ALTER TABLE itms.zonfp_spracovane_partneri RENAME TO zonfp_partneri'
    execute 'ALTER TABLE itms.zonfp_spracovane_polozky_rozpoctu RENAME TO zonfp_polozky_rozpoctu'
    execute 'ALTER TABLE itms.zonfp_spracovane_sekundarne_tematicke_okruhy RENAME TO zonfp_sekundarne_tematicke_okruhy'
    execute 'ALTER TABLE itms.zonfp_spracovane_typy_uzemia RENAME TO zonfp_typy_uzemia'
    execute 'ALTER TABLE itms.zonfp_spracovane_uzemne_mechanizmy RENAME TO zonfp_uzemne_mechanizmy'
  end
end
