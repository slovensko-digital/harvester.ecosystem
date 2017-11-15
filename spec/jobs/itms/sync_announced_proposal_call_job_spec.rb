require 'rails_helper'

RSpec.describe Itms::SyncAnnouncedProposalCallJob, type: :job do
  include_context 'itms_downloader'

  context '#perform' do
    it 'syncs planned call for proposals and all of its attributes' do
      expect(downloader)
        .to receive(:get)
        .with('https://opendata.itms2014.sk/v2/vyzvy/vyhlasene/2')
        .and_return(double(body: itms_file_fixture('vyzva_vyhlasena_item.json')))
        .once

      subject.perform('/v2/vyzvy/vyhlasene/2', downloader: downloader)

      expect(Itms::AnnouncedProposalCall.first).to have_attributes(
        itms_id: 2,
        itms_href: '/v2/vyzvy/vyhlasene/2',
        itms_created_at: DateTime.parse('2017-02-06T09:25:03.371Z'),
        itms_updated_at: DateTime.parse('2017-02-06T13:01:09.263Z'),

        alokacia_eu: 60531000,
        alokacia_sr: 7500000,
        datum_uzavretia: DateTime.parse('2015-11-10T00:00:00Z'),
        datum_vyhlasenia: DateTime.parse('2015-09-11T00:00:00Z'),
        doplnujuce_info: [
            Itms::AnnouncedProposalCallAdditionalInfo.find_by!(
                nazov: 'Webová stránka Operačného programu Kvalita životného prostredia',
                url: 'http://www.op-kzp.sk'
            ),
        ],
        druh: 'VYZVA',
        fondy: [
            Itms::CodelistValue.where_codelist_and_value(1032, 1).first!,
        ],
        kod: 'OPKZP-PO3-SC313-2015-2',
        konkretne_ciele_typy_aktivit: [
            Itms::AnnouncedProposalCallSpecificGoalActivityType.find_by!(
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 44),
                typ_aktivity: Itms::ActivityType.find_by!(itms_id: 333)
            ),
            Itms::AnnouncedProposalCallSpecificGoalActivityType.find_by!(
                konkretny_ciel: Itms::SpecificGoal.find_by!(itms_id: 44),
                typ_aktivity: Itms::ActivityType.find_by!(itms_id: 719)
            ),
        ],
        kontaktne_osoby: [
            Itms::Person.find_by!(
                email: 'lubos.rudohradsky@minv.sk',
                itms_id: 189,
                meno: 'Ľuboš',
                meno_uplne: 'Mgr. Ľuboš Rudohradský',
                priezvisko: 'Rudohradský',
                telefon: '02/50945088'
            ),
        ],
        nazov: '2. VÝZVA NA PREDKLADANIE ŽIADOSTÍ O NENÁVRATNÝ FINANČNÝ PRÍSPEVOK zameraná na vybudovanie technickej a inštitucionálnej podpory špecializovaných záchranných modulov',
        planovane_vyzvy: [
            Itms::PlannedProposalCall.find_by!(itms_id: 27),
        ],
        poskytovatelia: [
            Itms::Subject.find_by!(itms_id: 100002),
        ],
        posudzovane_obdobia: [
            Itms::AnnouncedProposalCallEvaluationPeriod.find_by!(
                datum_uzavierky: DateTime.parse('2016-09-30'),
                poradove_cislo: 1,
            ),
            Itms::AnnouncedProposalCallEvaluationPeriod.find_by!(
                datum_uzavierky: DateTime.parse('2016-11-30'),
                poradove_cislo: 2,
            ),
            Itms::AnnouncedProposalCallEvaluationPeriod.find_by!(
                datum_uzavierky: DateTime.parse('2017-01-31'),
                poradove_cislo: 3,
            ),
            Itms::AnnouncedProposalCallEvaluationPeriod.find_by!(
                datum_uzavierky: DateTime.parse('2017-05-15'),
                poradove_cislo: 4,
            ),
        ],
        stav: 'Vyhlásená',
        technicka_asistencia: false,
        typ: 'OTVORENA',
        vyhlasovatel: Itms::Subject.find_by!(itms_id: 100004)
      )
    end
  end
end
