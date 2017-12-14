class Itms::NrfcApplicationReceived < ApplicationRecord
  self.table_name = 'itms.zonfp'

  has_many :aktivity_projekt,
           class_name: 'Itms::NrfcApplicationActivity',
           foreign_key: :zonfp_id,
           dependent: :destroy

  has_and_belongs_to_many :formy_financovania,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.zonfp_formy_financovania',
                          association_foreign_key: :forma_financovania_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :hodnotitelia,
                          class_name: 'Itms::Person',
                          join_table: 'itms.zonfp_hodnotitelia',
                          association_foreign_key: :hodnotitel_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :hospodarske_cinnosti,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.zonfp_hospodarske_cinnosti',
                          association_foreign_key: :hospodarska_cinnost_id,
                          foreign_key: :zonfp_id

  has_many :meratelne_ukazovatele,
           class_name: 'Itms::NrfcApplicationMeasurableIndicator',
           foreign_key: :zonfp_id,
           dependent: :destroy

  has_and_belongs_to_many :miesta_realizacie,
                          class_name: 'Itms::ImplementationPlace',
                          join_table: 'itms.zonfp_miesta_realizacie',
                          association_foreign_key: :miesto_realizacie_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :miesta_realizacie_mimo_uzemia_op,
                          class_name: 'Itms::ImplementationPlace',
                          join_table: 'itms.zonfp_miesta_realizacie_mimo_uzemia_op',
                          association_foreign_key: :miesto_realizacie_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :oblasti_intervencie,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.zonfp_oblasti_intervencie',
                          association_foreign_key: :oblast_intervencie_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :organizacne_zlozky,
                          class_name: 'Itms::OrganisationalUnit',
                          join_table: 'itms.zonfp_organizacne_zlozky',
                          association_foreign_key: :organizacna_zlozka_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :partneri,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.zonfp_partneri',
                          association_foreign_key: :partner_id,
                          foreign_key: :zonfp_id

  has_many :polozky_rozpoctu,
           class_name: 'Itms::NrfcApplicationBudgetItem',
           foreign_key: :zonfp_id,
           dependent: :destroy

  has_and_belongs_to_many :sekundarny_tematicky_okruh,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.zonfp_sekundarne_tematicke_okruhy',
                          association_foreign_key: :sekundarny_tematicky_okruh_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :typy_uzemia,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.zonfp_typy_uzemia',
                          association_foreign_key: :typ_uzemia_id,
                          foreign_key: :zonfp_id

  has_and_belongs_to_many :uzemne_mechanizmy,
                          class_name: 'Itms::SpecificGoalCodelistValue',
                          join_table: 'itms.zonfp_uzemne_mechanizmy',
                          association_foreign_key: :uzemny_mechanizmus_id,
                          foreign_key: :zonfp_id

  belongs_to :vysledok_konania, class_name: 'Itms::CodelistValue'
  belongs_to :vyzva, class_name: 'Itms::AnnouncedProposalCall'
  belongs_to :ziadatel, class_name: 'Itms::Subject'
end
