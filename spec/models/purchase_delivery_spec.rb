require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
  end

  describe "商品購入機能" do
    context "購入できる" do
      it "必要な情報を適切に入力されていれば購入できる" do
        expect(@purchase_delivery).to be_valid
      end
      it "buildingが空でも購入できる" do
        @purchase_delivery.building = ""
        expect(@purchase_delivery).to be_valid
      end
    end
    context "購入できない" do
      it "post_codeが空では登録できない" do
        @purchase_delivery.post_code = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeは3桁ハイフン4桁でないと登録できない" do
        @purchase_delivery.post_code = "333-333"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "post_codeは半角文字列でないと登録できない" do
        @purchase_delivery.post_code = "あああ-ああああ"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空では登録できない" do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalが空では登録できない" do
        @purchase_delivery.municipal = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipal can't be blank")
      end
      it "streetが空では登録できない" do
        @purchase_delivery.street = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Street can't be blank")
      end
      it "callが空では登録できない" do
        @purchase_delivery.call = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Call can't be blank")
      end
      it "callは10桁未満では登録できない" do
        @purchase_delivery.call = "123456789"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Call is invalid. ")
      end
      it "callは11桁より多い桁数では登録できない" do
        @purchase_delivery.call = "123123456789"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Call is invalid. ")
      end
      it "callは半角数値以外は登録できない" do
        @purchase_delivery.call = "abcdefghijk"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Call is invalid. ")
      end
      it "tokenが空では登録できない" do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐づいていないと登録できない" do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていないと登録できない" do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
