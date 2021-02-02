class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  has_many :comments, foreign_key: :item_id, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :delivery_time
  belongs_to :shipping_charge
  belongs_to :condition

  validates :item_name, :description, :image, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  validates :category_id, :condition_id, :shipping_charge_id, :area_id, :delivery_time_id, numericality: { other_than: 1, message: 'Select' }

  def self.search(category_id,search)
    if category_id != ""
      if search != ""
        Item.where(category_id: category_id).where("item_name LIKE(?)", "%#{search}%")
        else
          Item.where(category_id: category_id)
        end 
      else 
        if search != ""
          Item.where("item_name LIKE(?)", "%#{search}%")
        else
          Item.all
        end
      end
  end
end
