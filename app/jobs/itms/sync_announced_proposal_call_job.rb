class Itms::SyncAnnouncedProposalCallJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      apc = Itms::AnnouncedProposalCall.find_or_create_by!(itms_id: json['id'])
      apc.itms_href = json['href']
      apc.itms_created_at = json['createdAt']
      apc.itms_updated_at = json['updatedAt']

      apc.alokacia_eu = json['alokaciaEU']
      apc.alokacia_sr = json['alokaciaSR']
      apc.datum_uzavretia = json['datumUzavretia']
      apc.datum_vyhlasenia = json['datumVyhlasenia']
      apc.doplnujuce_info = find_or_create_additional_info_by_json(json['doplnujuceInfo'], apc.doplnujuce_info)
      apc.druh = json['druh']
      apc.fondy = find_or_create_codelist_values_by_json(json['fondy'], downloader)
      apc.kod = json['kod']
      apc.konkretne_ciele_typy_aktivit = find_or_create_specific_goals_activity_types_by_json(json['konkretneCieleTypyAktivit'], apc.konkretne_ciele_typy_aktivit, downloader)
      apc.kontaktne_osoby = find_or_create_persons_by_json(json['kontaktneOsoby'])
      apc.nazov = json['nazov']
      apc.planovane_vyzvy = find_or_create_planned_proposal_calls_by_json(json['planovaneVyzvy'], downloader)
      apc.poskytovatelia = find_or_create_subjects_by_json(json['poskytovatelia'], downloader)
      apc.posudzovane_obdobia = find_or_create_evaluation_periods_by_json(json['posudzovaneObdobia'], apc.posudzovane_obdobia)
      apc.stav = json['stav']
      apc.technicka_asistencia = json['technickaAsistencia']
      apc.typ = json['typ']
      apc.vyhlasovatel = find_or_create_subject_by_json(json['vyhlasovatel'], downloader)

      apc.save!
    end
  end

  private

  def find_or_create_specific_goals_activity_types_by_json(json_list, scope, downloader)
    return [] if json_list.blank?
    json_list.map do |json|
      specific_goal = find_or_create_specific_goal_by_json(json['konkretnyCiel'], downloader)

      json['typyAktivit'].map do |activity_type_json|
        activity_type = find_or_create_activity_type_by_json(activity_type_json, downloader)

        scope.find_or_create_by!(
            konkretny_ciel: specific_goal,
            typ_aktivity: activity_type
        )
      end
    end.flatten
  end

  def find_or_create_planned_proposal_calls_by_json(json_list, downloader)
    return [] if json_list.blank?

    json_list.map do |json|
      next if json['id'] == 0 # workaround for https://itms3.axonpro.sk/browse/ITMSC-11444

      existing_object = Itms::PlannedProposalCall.find_by(itms_id: json['id'])
      next existing_object if existing_object.present?

      Itms::SyncPlannedProposalCallJob.perform_now(json['href'], downloader: downloader)
      Itms::PlannedProposalCall.find_by!(itms_id: json['id'])
    end.compact
  end

  def find_or_create_evaluation_periods_by_json(json_list, scope)
    return [] if json_list.blank?

    json_list.map do |json|
      scope.find_or_create_by!(
          datum_uzavierky: json['datumUzavierky'],
          poradove_cislo: json['poradoveCislo']
      )
    end
  end
end
