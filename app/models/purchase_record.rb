class PurchaseRecord

  include ActiveModel::Model
  attr_accessor :zip_code, :region_of_shipping_origin_id, :city, :street_address, :apartment_name, :tel, :purchase_record, :price

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel, format: {with: /\A[0-9]{11}\z/}
  end
  validates :region_of_shipping_origin_id, numericality: { other_than: 1, message: "--- can't be blank" }

  def save
    Address.create(zip_code: zip_code, region_of_shipping_origin: region_of_shipping_origin, city: city, street_address: street_address, apartment_name: apartment_name)
  end
end