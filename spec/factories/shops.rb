FactoryBot.define do
  factory :shop do
    sequence(:name) { |n| "Sushiya#{n}" }
    address { "Tokyo" }
    latitude { 0 }
    longitude { 0 }
    association :user, admin: true

    trait :with_comments do
      after(:create) { |shop| create_list(:comment, 5, shop: shop)}
    end
  end
end
