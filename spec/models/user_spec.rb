require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname,email,password,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録ができる" do
        expect(@user).to be_valid
      end
      it "passwordが英数字6文字以上であれば登録ができる" do
      @user.password = "1234567a"
      @user.password_confirmation = "1234567a"
      end
  end
    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user= FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていないと登録できない" do
        @user.email = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        end

      it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英数字混合でないと登録できない" do
      @user.password = "12345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが6文字未満だと登録できない" do
      @user.password = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)",)
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",)
      end

      it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角表記でないと登録できない" do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角表記でないと登録できない" do
        @user.last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
        end

      it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがカタカナ表記でないと登録できない" do
      @user.first_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end

      it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaがカタカナ表記でないと登録できない" do
      @user.last_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end

      it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end


end

