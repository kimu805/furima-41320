require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー情報" do
    context "新規登録できる場合" do
      it "nickname, email, password, password_confirmation, last_name_kanji, first_name_kanji, last_name_kana, first_name_kana, birthdayが存在すれば登録できる。" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できない場合" do
      it "Nicknameが空の場合、登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "Emailが空の場合、登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したEmailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@を含まないEmailは登録できない" do
        @user.email = "aaaaaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "Passwordが空の場合、登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "Passwordは5文字以下では登録できない" do
        @user.password = "a1a1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "Passwordは数字だけでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字の混合である必要があります")
      end
      it "Password confirmationが空の場合、登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "PasswordとPassword confirmationが一致していないと登録できない" do
        @user.password = "a1a1a1"
        @user.password_confirmation = "a2a2a2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe "本人情報確認" do
    context "新規登録できる場合" do
      it "nickname, email, password, password_confirmation, last_name_kanji, first_name_kanji, last_name_kana, first_name_kana, birthdayが存在すれば登録できる。" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できない場合"
    it "Last_name_kanjiが空の場合、登録できない" do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it "Last_name_kanjiは半角では登録できない" do
      @user.last_name_kanji = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji 全角文字（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "First_name_kanjiが空の場合、登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it "First_name_kanjiは半角では登録できない" do
      @user.first_name_kanji = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji 全角文字（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "Last_name_kanaが空の場合、登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "Last_name_kanaは漢字では登録できない" do
      @user.last_name_kana = "武士"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角文字（カタカナ）を使用してください")
    end
    it "First_name_kanaが空の場合、登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "First_name_kanaは感じでは登録できない" do
      @user.first_name_kana = "武士"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字（カタカナ）を使用してください")
    end
    it "Birthdayが空の場合、登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
