class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  has_many :likes
  
  validates :nickname, presence: true
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
    message: 'は半角英数字の混合である必要があります'
  }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :last_name_kanji
    validates :first_name_kanji
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字（カタカナ）を使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["nickname"]
  end
end
