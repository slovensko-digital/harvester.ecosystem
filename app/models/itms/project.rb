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
  has_many :oblasti_intervencie,
           class_name: Itms::ProjectInterventionArea,
           foreign_key: 'projekt_id'
  has_many :sekundarny_tematicky_okruh,
           class_name: Itms::ProjectSecondaryThematicArea,
           foreign_key: 'projekt_id'
  has_many :typy_uzemia,
           class_name: Itms::ProjectTerritoryType,
           foreign_key: 'projekt_id'
  has_many :uzemne_mechanizmy,
           class_name: Itms::ProjectTerritorialMechanism,
           foreign_key: 'projekt_id'
end
