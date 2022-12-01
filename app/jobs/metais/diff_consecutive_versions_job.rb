class Metais::DiffConsecutiveVersionsJob < ApplicationJob
  queue_as :metais

  OBSERVED_ATTRIBUTES = ['nazov', 'kod_metais', 'typ_investicie', 'prijimatel', 'faza_projektu', 'program', 'popis', 'datum_zacatia', 'termin_ukoncenia', 'schvalovaci_proces', 'zdroj', 'financna_skupina', 'suma_vydavkov', 'rocne_naklady', 'ref_id', 'status', 'zmena_stavu', 'schvalene_rocne_naklady', 'schvaleny_rozpocet', 'datum_nfp', 'link_nfp', 'vyhlasenie_vo', 'vo', 'zmluva_o_dielo', 'zmluva_o_dielo_crz']

  def perform(version)
    ActiveRecord::Base.transaction do
      previous = version.previous
      return unless previous

      OBSERVED_ATTRIBUTES.each do |key|
        Metais::ProjectChange.create(
          project_version: version,
          field: key,
          old_value: previous[key].to_s,
          new_value: version[key].to_s
        ).save! if version[key] != previous[key]
      end
    end
  end
end
