FactoryBot.define do
  factory :order_address do
    postal_code       { "#{format('%03d', rand(1000))}-#{format('%04d', rand(10_000))}" }
    prefecture_id     { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    city              { Faker::Address.city }
    street_address    { Faker::Address.street_name }
    building          { Faker::Address.secondary_address }
    phone_number      { Faker::Number.leading_zero_number(digits: 10) }
    token             { 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' }
    user_id           { '1' }
    item_id           { '1' }

  end
end
