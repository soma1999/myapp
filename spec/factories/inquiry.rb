FactoryBot.define do
  factory :inquiry do
    name {"Sunny太郎"}
    email {Faker::Internet.free_email}
    message {"こんにちは"}
  end
end