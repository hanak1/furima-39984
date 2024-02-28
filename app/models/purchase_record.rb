class PurchaseRecord

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :region_of_shipping_origin_id, :city, :street_address, :apartment_name, :tel, :purchase_record, :price

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :tel, format: {with: /\A[0-9]{11}\z/}

  end
  validates :region_of_shipping_origin_id, numericality: { other_than: 1, message: "--- can't be blank" }

  def save
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(zip_code: zip_code, region_of_shipping_origin_id: region_of_shipping_origin_id, city: city, street_address: street_address, apartment_name: apartment_name, order_id: order.id)
  end
end