class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order


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
  validates :price, presence: true, numericality: {only_integer: true, message: 'Half-width number'}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
  # ジャンルの選択が「---」の時は保存できない
  validates :category_id, numericality: { other_than: 1, message: "--- can't choose" }
  validates :product_condition_id, numericality: { other_than: 1, message: "--- can't choose" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "--- can't choose" }
  validates :region_of_shipping_origin_id, numericality: { other_than: 1, message: "--- can't choose" }
  validates :estimated_delivery_date_id, numericality: { other_than: 1, message: "--- can't choose" }
  validates :image, presence: true
end
