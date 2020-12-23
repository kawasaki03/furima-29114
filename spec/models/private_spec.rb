require 'rails_helper'

RSpec.describe Private, type: :model do
  before do
    @private = FactoryBot.build(:private)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録ができる' do
        expect(@private).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'first_nameが空だと登録できない' do
        @private.first_name = ''
        @private.valid?
        expect(@private.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角表記でないと登録できない' do
        @private.first_name = 'aaaa'
        @private.valid?
        expect(@private.errors.full_messages).to include('First name Full-width characters')
      end

      it 'last_nameが空だと登録できない' do
        @private.last_name = ''
        @private.valid?
        expect(@private.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角表記でないと登録できない' do
        @private.last_name = 'aaaa'
        @private.valid?
        expect(@private.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'first_name_kanaが空だと登録できない' do
        @private.first_name_kana = ''
        @private.valid?
        expect(@private.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaがカタカナ表記でないと登録できない' do
        @private.first_name_kana = 'aaaa'
        @private.valid?
        expect(@private.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'last_name_kanaが空だと登録できない' do
        @private.last_name_kana = ''
        @private.valid?
        expect(@private.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaがカタカナ表記でないと登録できない' do
        @private.last_name_kana = 'aaaa'
        @private.valid?
        expect(@private.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end

      it 'birthdayが空だと登録できない' do
        @private.birthday = ''
        @private.valid?
        expect(@private.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
