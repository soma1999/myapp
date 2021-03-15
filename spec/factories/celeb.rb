FactoryBot.define do
  factory :celeb do
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    name {"Sunny太郎"}
    description {"これは架空の人物です。生年月日・年齢・国籍・経歴：いずれも不明。素性については多くの仮説が立てられているが、正確なところはわかっていない。"} 

    after(:build) do |celeb|
      celeb.image.attach(io: File.open('app/assets/images/default-image.png'), filename: 'default-image.png')
    end
  end
end