FactoryBot.define do
  factory :upvs_public_authority_edesk, class: Upvs::PublicAuthorityEdesk do
    sequence(:cin) { |n| 10_000_000 + n }
    sequence(:uri) { |n| "ico://sk/#{10_000_000 + n}_90000" }
    sequence(:name) { |n| "Súkromná materská škola #{n}, Starozagorská 8, Košice" }
    street { 'Starozagorská' }
    street_number { 8 }
    postal_code { '04023' }
    city { 'Košice - mestská časť Sídlisko KVP' }
  end
end
