class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipal, :street, :building, :call, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が適切ではありません。ハイフンが必要です。"}
    validates :prefecture_id, numericality: {other_than: 1, message: "を入力してください。"}
    validates :municipal
    validates :street
    validates :call, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "が適切ではありません。 "}
  end
  
  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipal: municipal, street: street, building: building, call: call, purchase_id: purchase.id)
  end
end