User.create!(
  email: "s@s",
  password: "so12ma13",
  nickname: "管理者",
  last_name: "中川",
  first_name: "颯馬",
  last_name_katakana: "ナカガワ",
  first_name_katakana: "ソウマ",
  birthday: "1999-12-13",
  admin: true
  )

  10.times do |n|
    name = Faker::Japanese::Name.name
    email = Faker::Internet.email
    password = "111111a"
    password
    description = "これは架空の人物です。生年月日・年齢・国籍・経歴：いずれも不明。素性については多くの仮説が立てられているが、正確なところはわかっていない。"

    celeb = Celeb.create(
      name: name,
      email: email,
      password: password,
      description: description,
    )
    celeb.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')

  end