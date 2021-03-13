FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {"Sunny太郎"}
    first_name {"山田"}
    last_name  {"太郎"}
    first_name_katakana {"ヤマダ"}
    last_name_katakana {"タロウ"}
    birthday {"2020/01/01"} 

    after(:build) do |user|
      user.image.attach(io: File.open('app/assets/images/default-image.png'), filename: 'default-image.png')
    end
  end
end