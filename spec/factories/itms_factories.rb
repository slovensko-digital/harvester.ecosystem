FactoryBot.define do
  factory :itms_intensity, class: Itms::Intensity do
    itms_id { 1 }
    itms_href { '/v2/intenzita/1' }
    nazov { 'Intenzita 312020/7170/LDR/30794536' }
    deleted_at { }
  end
end

