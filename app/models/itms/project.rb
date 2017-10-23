class Itms::Project < ApplicationRecord
  self.table_name = 'itms.projekty'

  belongs_to :prijimatel, class_name: Itms::Subject
  has_many :projekty_aktivity,
           class_name: Itms::ProjectProjectActivity,
           foreign_key: 'projekt_id'
  has_many :aktivity,
           through: :projekty_aktivity,
           source: :aktivita
  has_many :projekty_formy_financovania,
           class_name: Itms::ProjectFinancingForm,
           foreign_key: 'projekt_id'
  has_many :formy_financovania,
           through: :projekty_formy_financovania,
           source: :forma_financovania
  has_many :projekty_hospodarske_cinnosti,
           class_name: Itms::ProjectEconomicActivity,
           foreign_key: 'projekt_id'
  has_many :hospodarske_cinnosti,
           through: :projekty_hospodarske_cinnosti,
           source: :hospodarska_cinnost
  has_many :projekty_intenzity,
           class_name: Itms::ProjectIntensity,
           foreign_key: 'projekt_id'
  has_many :intenzity,
           through: :projekty_intenzity,
           source: :intenzita
  has_many :projekty_oblasti_intervencie,
           class_name: Itms::ProjectInterventionArea,
           foreign_key: 'projekt_id'
  has_many :oblasti_intervencie,
           through: :projekty_oblasti_intervencie,
           source: :oblast_intervencie
  has_many :projekty_sekundarne_tematicke_okruhy,
           class_name: Itms::ProjectSecondaryThematicArea,
           foreign_key: 'projekt_id'
  has_many :sekundarny_tematicky_okruh,
           through: :projekty_sekundarne_tematicke_okruhy,
           source: :sekundarny_tematicky_okruh
  has_many :projekty_typy_uzemia,
           class_name: Itms::ProjectTerritoryType,
           foreign_key: 'projekt_id'
  has_many :typy_uzemia,
           through: :projekty_typy_uzemia,
           source: :typ_uzemia
  has_many :projekty_uzemne_mechanizmy,
           class_name: Itms::ProjectTerritorialMechanism,
           foreign_key: 'projekt_id'
  has_many :uzemne_mechanizmy,
           through: :projekty_uzemne_mechanizmy,
           source: :uzemny_mechanizmus
end
