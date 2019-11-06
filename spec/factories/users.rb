FactoryBot.define do
  factory :user do
    name { "Tester" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
    confirmed_at { Date.today }

    trait :admin_user do
      admin { true }
    end

  end
end
