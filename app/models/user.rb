class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nick_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  # validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  # 下の段はもしかしたら{ with: /\A[ァ-ヶ一ー]+\z/,でーがぬけているかも。様子見る
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角文字を使用してください' } do
    validates :japanese_last_name, presence: true
    validates :japanese_last_name, presence: true
  end
  validates :birth_date, presence: true

  has_many :items
  has_many :purchase_records
end
