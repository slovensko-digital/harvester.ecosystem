class Itms::AnnouncedProposalCall < ApplicationRecord
  self.table_name = 'itms.vyzvy_vyhlasene'

  belongs_to :vyhlasovatel, class_name: 'Itms::Subject', optional: true

  has_many :doplnujuce_info,
           class_name: 'Itms::AnnouncedProposalCallAdditionalInfo',
           foreign_key: 'vyzva_id',
           dependent: :destroy

  has_and_belongs_to_many :fondy,
                          class_name: 'Itms::CodelistValue',
                          join_table: 'itms.vyzvy_vyhlasene_fondy',
                          association_foreign_key: :fond_id,
                          foreign_key: :vyzva_id

  has_many :konkretne_ciele_typy_aktivit,
           class_name: 'Itms::AnnouncedProposalCallSpecificGoalActivityType',
           foreign_key: 'vyzva_id',
           dependent: :destroy

  has_and_belongs_to_many :kontaktne_osoby,
                          class_name: 'Itms::Person',
                          join_table: 'itms.vyzvy_vyhlasene_kontaktne_osoby',
                          association_foreign_key: :osoba_id,
                          foreign_key: :vyzva_id

  has_and_belongs_to_many :planovane_vyzvy,
                          class_name: 'Itms::PlannedProposalCall',
                          join_table: 'itms.vyzvy_vyhlasene_vyzvy_planovane',
                          association_foreign_key: :planovana_vyzva_id,
                          foreign_key: :vyhlasena_vyzva_id

  has_and_belongs_to_many :poskytovatelia,
                          class_name: 'Itms::Subject',
                          join_table: 'itms.vyzvy_vyhlasene_poskytovatelia',
                          association_foreign_key: :poskytovatel_id,
                          foreign_key: :vyzva_id

  has_many :posudzovane_obdobia,
           class_name: 'Itms::AnnouncedProposalCallEvaluationPeriod',
           foreign_key: 'vyzva_id',
           dependent: :destroy
end
