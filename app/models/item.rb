class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee
  belongs_to :region_of_shipping_origin
  belongs_to :estimated_delivery_date
  belongs_to :user
  # 空のitem投稿を保存できないようにする
  validates :product_name, :product_detail, presence: true
  # 価格は半角数字のみの意味
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  # ジャンルの選択が「---」の時は保存できない
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_of_shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
