require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品の購入機能' do
 before do 
  @order = FactoryBot.build(:order)
 end

 it '全ての値が正しく入力されていれば保存ができること' do
  expect(@order).to be_valid
 end

 it 'postal_codeが空だと保存できないこと' do
  @order.postal_code = ""
  @order.valid?
  expect(@order.errors.full_messages).to include ("Postal code can't be blank")
 end
 it 'postal_codeがハイフンを含んだ形でないと保存できないこと' do
  @order.postal_code = "1234567"
  @order.valid?
  expect(@order.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
 end
 it 'postal_codeが全角文字だと保存できないこと' do
  @order.postal_code = "１２３ー４５６７"
  @order.valid?
  expect(@order.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
 end
 it 'area_id が空だと保存できないこと' do
  @order.area_id = ""
  @order.valid?
  expect(@order.errors.full_messages).to include ("Area can't be blank")
 end
 it 'city が空だと保存できないこと' do
  @order.city = ""
  @order.valid?
  expect(@order.errors.full_messages).to include ("City can't be blank")
 end
 it 'house_number が空だと保存できないこと' do
  @order.house_number = ""
  @order.valid?
  expect(@order.errors.full_messages).to include ("House number can't be blank")
 end
 it 'building_nameが空でも保存できること' do
  @order.building_name = ""
  @order.valid?
  expect(@order).to be_valid
 end
 it 'phone_number が空だと保存できないこと' do
  @order.phone_number = ""
  @order.valid?
  expect(@order.errors.full_messages).to include ("Phone number can't be blank")
 end
 it 'phone_number が12文字以上の場合保存できないこと' do
  @order.phone_number = "123456789101"
  @order.valid?
  expect(@order.errors.full_messages).to include ("Phone number is invalid")
 end
 it 'phone_number が半角文字でないと保存できないこと' do
  @order.phone_number = "１２３４５６７８９１０"
  @order.valid?
  expect(@order.errors.full_messages).to include ("Phone number is invalid")
 end
 it 'token が空だと保存できないこと' do
  @order.token = ""
  @order.valid?
  expect(@order.errors.full_messages).to include ("Token can't be blank")
 end
 
end
end



