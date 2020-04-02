FactoryBot.define do
  factory :shop_favorite do
    association :user
    association :shop
  end
end
