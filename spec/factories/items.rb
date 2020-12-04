FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.sentence(word_count: 2) }
    information       { Faker::Lorem.sentence(word_count: 10) }
    status_id         { Faker::Number.between(from: 2, to: Status.all.length) }
    category_id       { Faker::Number.between(from: 2, to: Category.all.length) }
    shipping_cost_id  { Faker::Number.between(from: 2, to: ShippingCost.all.length) }
    prefecture_id     { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    days_to_ship_id   { Faker::Number.between(from: 2, to: DaysToShip.all.length) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
