FactoryBot.define do
  factory :user do
    user = Gimei::name

    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {user.first.kanji}
    last_name             {user.last.kanji}
    first_name_kana       {user.first.katakana}
    last_name_kana        {user.last.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
