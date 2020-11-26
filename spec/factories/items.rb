FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.words }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 6) }
    condition_id { Faker::Number.between(from: 2, to: 6) }
    shipping_charge_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 40) }
    delivery_time_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/camera.png'), filename: 'test_image.png')
    end
  end
end
