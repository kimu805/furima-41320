class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :last_name_kanji
    validates :first_name_kanji
  end
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字（カタカナ）を使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true
end
