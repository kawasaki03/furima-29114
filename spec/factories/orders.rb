FactoryBot.define do
  factory :order do
    user_id {association :user} 
    item_id {association :item} 
    postal_code {'123-4567'}
    area_id {3}
    city {'横浜市'}
    house_number {'1-1'}
    building_name {'レジデンス'}
    phone_number {'09012345678'}
    price {3000}
    token {"tok_abcdefghijk12345678900000000"}
  end
end
