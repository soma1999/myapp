FactoryBot.define do
  factory :room do
    association :user
    association :celeb
  end
end