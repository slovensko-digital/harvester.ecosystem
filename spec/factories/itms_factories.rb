FactoryBot.define do
  factory :itms_intensity, class: Itms::Intensity do
    itms_id { 1 }
    itms_href { '/v2/intenzita/1' }
    nazov { 'Intenzita 312020/7170/LDR/30794536' }
    deleted_at { nil }
  end

  factory :itms_supplier, class: Itms::Supplier do
    itms_id { 229 }
    itms_href { '/v2/dodavatelia/229' }
    itms_created_at { DateTime.parse('2016-11-02T09:19:15.117Z') }
    itms_updated_at { DateTime.parse('2016-11-02T09:19:15.125Z') }
    dic { '2020845057' }
    ico { '00151513' }
    ine_identifikacne_cislo { '41076659' }
    nazov { 'Úrad vlády SR' }
    psc { '81370' }
    ulica { 'Námestie slobody' }
    ulica_cislo { '1' }
    deleted_at { nil }
  end

  factory :itms_budget_item, class: Itms::BudgetItem do
    itms_id { 1 }
    itms_href { '/v2/polozkaRozpoctu/1' }
    viazana_suma { 7002729.1 }
    volne_prostriedky { 25278444.49 }
    vratena_suma { 0 }
    zazmluvnena_suma { 32281173.59 }
    deleted_at { nil }
  end

  factory :itms_codelist, class: Itms::Codelist do
    ciselnik_kod { 1006 }
    nazov { 'Katalóg územnosprávnych jednotiek NUTS (Eurostat)' }
    popis { 'Číselník regiónov - NUTS = všetky úrovne.  Číselník spravuje EuroStat.' }
  end

  factory :itms_codelist_value, class: Itms::CodelistValue do
    ciselnik factory: :itms_codelist
    itms_id { 1 }
    itms_href { '/v2/hodnotaCiselnika/1006/hodnota/1' }
    kod { '1006SK041A526665' }
    kod_zdroj { 'SK041A526665' }
    nazov { 'Stará Ľubovňa' }
    platnost_do { nil }
    platnost_od { '2004-08-01 00:00:00' }
    popis { nil }
    deleted_at { nil }
  end
end
