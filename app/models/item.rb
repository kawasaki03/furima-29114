class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :delivery_time
  belongs_to :shipping_charge
  belongs_to :condition

  validates :item_name, :description, :user_id, presence: true
  validates :price,presence: true,format:{with: /\A[0-9]+\z/},numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :category_id, :condition_id, :shipping_charge_id, :area_id, :delivery_time_id, numericality: { other_than: 1 } 
end
