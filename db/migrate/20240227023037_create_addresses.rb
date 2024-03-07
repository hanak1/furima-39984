class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code,                                    null: false
      t.integer :region_of_shipping_origin_id,            null: false
      t.string :city,                                        null: false
      t.string :street_address,                              null: false
      t.string :apartment_name,                              null: false
      t.string :tel,                                         null: false
      t.references :order,                                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
