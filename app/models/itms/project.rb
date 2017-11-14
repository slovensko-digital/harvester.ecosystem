class Itms::Project < ApplicationRecord
  self.table_name = 'itms.projekty'

  belongs_to :prijimatel, class_name: Itms::Subject
  has_many :projekty_aktivity,
           class_name: Itms::ProjectProjectActivity,
           foreign_key: 'projekt_id'
  has_many :aktivity,
           through: :projekty_aktivity,
           source: :aktivita
  has_many :formy_financovania,
           class_name: Itms::ProjectFinancingForm,
           foreign_key: 'projekt_id'
  has_many :hospodarske_cinnosti,
           class_name: Itms::ProjectEconomicActivity,
           foreign_key: 'projekt_id'
  has_many :projekty_intenzity,
           class_name: Itms::ProjectIntensity,
           foreign_key: 'projekt_id'
  has_many :intenzity,
           through: :projekty_intenzity,
           source: :intenzita
  has_many :meratelne_ukazovatele,
           class_name: Itms::MeasurableIndicator,
           foreign_key: 'projekt_id'
  has_many :projekty_miesta_realizacie,
           class_name: Itms::ProjectImplementationPlace,
           foreign_key: 'projekt_id'
  has_many :miesta_realizacie,
           through: :projekty_miesta_realizacie,
           source: :miesto_realizacie
  has_many :projekty_miesta_realizacie_mimo_uzemia_op,
           class_name: Itms::ProjectImplementationPlaceOutsideOpArea,
           foreign_key: 'projekt_id'
  has_many :miesta_realizacie_mimo_uzemia_op,
           through: :projekty_miesta_realizacie_mimo_uzemia_op,
           source: :miesto_realizacie
  has_many :monitorovacie_terminy,
           class_name: Itms::MonitoringDate,
           foreign_key: 'projekt_id',
           dependent: :destroy
  has_many :oblasti_intervencie,
           class_name: Itms::ProjectInterventionArea,
           foreign_key: 'projekt_id'
  has_many :projekty_organizacne_zlozky,
           class_name: Itms::ProjectOrganisationalUnit,
           foreign_key: 'projekt_id'
  has_many :organizacne_zlozky,
           through: :projekty_organizacne_zlozky,
           source: :organizacna_zlozka
  has_many :projekty_partneri,
           class_name: Itms::ProjectPartner,
           foreign_key: 'projekt_id'
  has_many :partneri,
           through: :projekty_partneri,
           source: :partner  
  has_many :projekty_polozky_rozpoctu,
           class_name: Itms::ProjectBudgetItem,
           foreign_key: 'projekt_id'
  has_many :polozky_rozpoctu,
           through: :projekty_polozky_rozpoctu,
           source: :polozka_rozpoctu
  belongs_to :schvalena_zonfp, class_name: Itms::NfcRequest
  has_many :sekundarny_tematicky_okruh,
           class_name: Itms::ProjectSecondaryThematicArea,
           foreign_key: 'projekt_id'
  has_many :typy_uzemia,
           class_name: Itms::ProjectTerritoryType,
           foreign_key: 'projekt_id'
  has_many :uzemne_mechanizmy,
           class_name: Itms::ProjectTerritorialMechanism,
           foreign_key: 'projekt_id'
  belongs_to :vyzva, class_name: Itms::ProposalCall
end
