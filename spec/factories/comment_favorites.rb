FactoryBot.define do
  factory :comment_favorite do
    association :comment
    association :user
  end
end
