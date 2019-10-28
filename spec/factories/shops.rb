FactoryBot.define do
  factory :shop do
    sequence(:name) { |n| "Sushiya#{n}" }
    address { "Tokyo" }
    latitude { 0 }
    longitude { 0 }
    association :user
  end
end
