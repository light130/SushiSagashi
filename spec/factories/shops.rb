FactoryBot.define do
  factory :shop do
    sequence(:name) { |n| "寿司屋#{n}"}
    address { "MyString" }
    budget { "MyString" }
    opening_hours { "MyString" }
    picture { "MyString" }
    user { nil }
  end
end
