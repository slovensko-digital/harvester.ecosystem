class ChangeOnDeleteConstraintsOnItmsIntensity < ActiveRecord::Migration[5.0]
  def change
    execute 'ALTER TABLE itms.intenzity DROP CONSTRAINT fk_rails_818c3c0e61' # zdroj_eu_id
    execute 'ALTER TABLE itms.intenzity DROP CONSTRAINT fk_rails_cc33bd1188' # zdroj_pr_id
    execute 'ALTER TABLE itms.intenzity DROP CONSTRAINT fk_rails_ffc31e6216' # zdroj_sr_id
    execute 'ALTER TABLE itms.intenzity DROP CONSTRAINT fk_rails_342c83d880' # zdroj_vz_id
    execute 'ALTER TABLE itms.intenzity DROP CONSTRAINT fk_rails_e965354053' # zdroj_yei_id

    add_foreign_key 'itms.intenzity', 'itms.intenzity_zdroje', column: :zdroj_eu_id, on_delete: :nullify
    add_foreign_key 'itms.intenzity', 'itms.intenzity_zdroje', column: :zdroj_pr_id, on_delete: :nullify
    add_foreign_key 'itms.intenzity', 'itms.intenzity_zdroje', column: :zdroj_sr_id, on_delete: :nullify
    add_foreign_key 'itms.intenzity', 'itms.intenzity_zdroje', column: :zdroj_vz_id, on_delete: :nullify
    add_foreign_key 'itms.intenzity', 'itms.intenzity_zdroje', column: :zdroj_yei_id, on_delete: :nullify
  end
end
