FactoryBot.define do
  factory :itms_intensity, class: Itms::Intensity do
    itms_id { 1 }
    itms_href { '/v2/intenzita/1' }
    nazov { 'Intenzita 312020/7170/LDR/30794536' }
    deleted_at { nil }

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
end
