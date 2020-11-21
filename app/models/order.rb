class Order
  include ActiveModel::Model
  attr_accessor :user,:item,:postal_code,:area_id,:city,:house_number,:building_name,:phone_number,:purchase_record


with_options presence: true do
  validates :user
  validates :item
  validates :postal_code,format: {with:/\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Include hyphen(-)"}
  validates :area_id, numericality: {other_than:0, message:"can't be blank"}
  validates :city
  validates :house_number
  validates :phone_number,format: {with:  /\A\d{10,11}\z/}
  validates :purchase_record
end

def save 
  PurchaseRecord.create(user: user, item: item)
  Address.create(postal_code: postal_code, area_id: area_id,city: city, house_number: house_number, phone_number: phone_number, purchase_record: purchase_record)
end

end