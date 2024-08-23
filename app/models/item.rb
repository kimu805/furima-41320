class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase
  has_many :likes
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_pay
  belongs_to :prefecture
  belongs_to :shipping_time

  validates :images, :name, :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力して下さい。"}
  validates :condition_id, numericality: { other_than: 1, message: "を入力して下さい。"}
  validates :shipping_pay_id, numericality: { other_than: 1, message: "を入力して下さい。"}
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力して下さい。"}
  validates :shipping_time_id, numericality: { other_than: 1, message: "を入力して下さい。"}
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: {message: "を入力して下さい。"}
  end
  validates :images, length: { minimum: 1, maximum: 5, message:"は1枚以上5枚以下にしてください。"}

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "condition_id", "created_at", "description", "id", "name", "prefecture_id", "price", "shipping_pay_id", "shipping_time_id", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
