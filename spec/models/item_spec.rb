require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @user = FactoryBot.create(:user)
  end

  describe '商品の出品機能' do
    context '出品ができる時' do
      it 'image,item_name,description,price,category_id,condition_id,shipping_charge_id,area_id,delivery_time_id,user_idが存在すると、商品の出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '出品に失敗する時' do
      it 'imageが空だと出品ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品ができない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空だと出品ができない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空だと出品ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥300~¥9,999,999の間でないと登録ができない' do
        @item.price = 30
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'category_idが空だと出品ができない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが空だと出品ができない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'shipping_charge_idが空だと出品ができない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end
      it 'area_idが空だと出品ができない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end
      it 'delivery_time_idが空だと出品ができない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time Select')
      end
      it 'user情報が紐づいていないと出品ができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
