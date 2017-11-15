class Itms::AnnouncedProposalCall < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene'

  belongs_to :vyhlasovatel, class_name: Itms::Subject

  has_many :doplnujuce_info,
           class_name: Itms::AnnouncedProposalCallAdditionalInfo,
           foreign_key: 'vyzva_id'

  has_many :vyzvy_vyhlasene_fondy,
           class_name: Itms::AnnouncedProposalCallFund,
           foreign_key: 'vyzva_id'
  has_many :fondy,
           through: :vyzvy_vyhlasene_fondy,
           source: :fond

  has_many :konkretne_ciele_typy_aktivit,
           class_name: Itms::AnnouncedProposalCallSpecificGoalActivityType,
           foreign_key: 'vyzva_id'

  has_many :vyzvy_vyhlasene_kontaktne_osoby,
           class_name: Itms::AnnouncedProposalCallContactPerson,
           foreign_key: 'vyzva_id'
  has_many :kontaktne_osoby,
           through: :vyzvy_vyhlasene_kontaktne_osoby,
           source: :osoba

  has_many :vyzvy_vyhlasene_vyzvy_planovane,
           class_name: Itms::AnnouncedProposalCallPlannedProposalCall,
           foreign_key: 'vyhlasena_vyzva_id'
  has_many :planovane_vyzvy,
           through: :vyzvy_vyhlasene_vyzvy_planovane,
           source: :planovana_vyzva

  has_many :vyzvy_vyhlasene_poskytovatelia,
           class_name: Itms::AnnouncedProposalCallProvider,
           foreign_key: 'vyzva_id'
  has_many :poskytovatelia,
           through: :vyzvy_vyhlasene_poskytovatelia,
           source: :poskytovatel

  has_many :posudzovane_obdobia,
           class_name: Itms::AnnouncedProposalCallEvaluationPeriod,
           foreign_key: 'vyzva_id'
end
