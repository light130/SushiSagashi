FactoryBot.define do
  factory :good do
    association :comment
    association :user
  end
end
