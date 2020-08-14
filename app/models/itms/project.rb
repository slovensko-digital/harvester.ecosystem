class Itms::Project < ApplicationRecord
  self.table_name = 'itms.projekty'

  belongs_to :prijimatel, class_name: 'Itms::Subject', optional: true

  has_and_belongs_to_many :aktivity,
                          class_name: 'Itms::Activity',
                          join_table: 'itms.projekty_aktivity',
                          association_foreign_key: :aktivita_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :formy_financovania,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.projekty_formy_financovania',
                          association_foreign_key: :forma_financovania_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :hospodarske_cinnosti,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.projekty_hospodarske_cinnosti',
                          association_foreign_key: :hospodarska_cinnost_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :intenzity,
                          class_name: 'Itms::Intensity',
                          join_table: 'itms.projekty_intenzity',
                          association_foreign_key: :intenzita_id,
                          foreign_key: :projekt_id

  has_many :meratelne_ukazovatele,
           class_name: 'Itms::MeasurableIndicator',
           foreign_key: 'projekt_id',
           dependent: :destroy

  has_and_belongs_to_many :miesta_realizacie,
                          class_name: 'Itms::ImplementationPlace',
                          join_table: 'itms.projekty_miesta_realizacie',
                          association_foreign_key: :miesto_realizacie_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :miesta_realizacie_mimo_uzemia_op,
                          class_name: 'Itms::ImplementationPlace',
                          join_table: 'itms.projekty_miesta_realizacie_mimo_uzemia_op',
                          association_foreign_key: :miesto_realizacie_id,
                          foreign_key: :projekt_id

  has_many :monitorovacie_terminy,
           class_name: 'Itms::MonitoringDate',
           foreign_key: 'projekt_id',
           dependent: :destroy

  has_and_belongs_to_many :oblasti_intervencie,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.projekty_oblasti_intervencie',
                          association_foreign_key: :oblast_intervencie_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :organizacne_zlozky,
                          class_name: 'Itms::OrganisationalUnit',
                          join_table: 'itms.projekty_organizacne_zlozky',
                          association_foreign_key: :organizacna_zlozka_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :partneri,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.projekty_partneri',
                          association_foreign_key: :partner_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :polozky_rozpoctu,
                          class_name: 'Itms::BudgetItem',
                          join_table: 'itms.projekty_polozky_rozpoctu',
                          association_foreign_key: :polozka_rozpoctu_id,
                          foreign_key: :projekt_id


  belongs_to :schvalena_zonfp, class_name: 'Itms::NrfcApplicationProcessed', optional: true

  has_and_belongs_to_many :sekundarny_tematicky_okruh,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.projekty_sekundarne_tematicke_okruhy',
                          association_foreign_key: :sekundarny_tematicky_okruh_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :typy_uzemia,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.projekty_typy_uzemia',
                          association_foreign_key: :typ_uzemia_id,
                          foreign_key: :projekt_id

  has_and_belongs_to_many :uzemne_mechanizmy,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.projekty_uzemne_mechanizmy',
                          association_foreign_key: :uzemny_mechanizmus_id,
                          foreign_key: :projekt_id

  belongs_to :vyzva, class_name: 'Itms::AnnouncedProposalCall', optional: true
end
