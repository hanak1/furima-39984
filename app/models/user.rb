class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' } do
    validates :japanese_last_name, presence: true
    validates :japanese_last_name, presence: true
  end
  validates :birth_date, presence: true

  # has_many :items
  # has_many :purchase_records
end
