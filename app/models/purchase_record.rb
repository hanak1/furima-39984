class PurchaseRecord

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :region_of_shipping_origin_id, :city, :street_address, :apartment_name, :tel, :purchase_record, :price, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :city
    validates :street_address
    validates :tel, format: {with: /\A[0-9]{11}\z/}
    validates :region_of_shipping_origin_id, numericality: { other_than: 1, message: "--- can't choose" }
    validates :token
  end

  def save
     order = Order.create(item_id: item_id, user_id: user_id)
     Address.create(tel: tel, zip_code: zip_code, region_of_shipping_origin_id: region_of_shipping_origin_id, city: city, street_address: street_address, apartment_name: apartment_name, order_id: order.id)
  end
end
