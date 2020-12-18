
num = 5 #作成するアカウント数

num.times do |n|
  user = Gimei.name
  password = "123qwe"
  # password = Faker::Internet.password(min_length: 6) + rand(10).to_s
  test = User.create(
    nickname:               Faker::Name.initials(number: 5) ,
    email:                  "test#{n}@com",
    password:               password ,
    password_confirmation:  password ,
    first_name:             user.first.kanji  ,
    last_name:              user.last.kanji  ,
    first_name_kana:        user.first.katakana ,
    last_name_kana:         user.last.katakana ,
    birthday:               Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end
