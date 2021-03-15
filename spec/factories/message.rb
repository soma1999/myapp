FactoryBot.define do
  factory :message do
    content = "こんにちは"
    content {content}
    association :user
    association :celeb
    association :room
  end
end