class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :delivery_time
  belongs_to :shipping_time
  belongs_to :condition

end
