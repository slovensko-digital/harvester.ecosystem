FactoryBot.define do
  factory :upvs_public_authority_edesk, class: Upvs::PublicAuthorityEdesk do
    sequence(:cin) { |n| 10_000_000 + n }
    sequence(:uri) { |n| "ico://sk/#{10_000_000 + n}_90000" }
    sequence(:name) { |n| "Súkromná materská škola #{n}, Starozagorská 8, Košice" }
  end

  factory :upvs_service_with_form, class: Upvs::ServiceWithForm do
    sequence(:id_service_instance) { |n| 10_000_000 + n }
    sequence(:uri) { |n| "ico://sk/#{10_000_000 + n}_90000" }
    sequence(:name) { |n| "Service #{n}" }
    sequence(:institution_name) { |n| "Súkromná materská škola #{n}, Starozagorská 8, Košice" }
    sequence(:url) { |n| "http://example.com/#{n}" }
    sequence(:form_url) { |n| "http://example.com/form-url/#{n}" }
  end
end
