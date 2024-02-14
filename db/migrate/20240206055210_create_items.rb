class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product_name,                     null: false
      t.string :product_detail,                   null: false
      t.integer :category_id,                     null: false
      t.integer :product_condition_id,             null: false
      t.integer :shipping_fee_id,                   null: false
      t.integer :region_of_shipping_origin_id,     null: false
      t.integer :estimated_delivery_date_id,        null: false
      t.integer :price,                             null: false
      t.references :user,                           null: false, foreign_key: true
      t.timestamps        
    end
  end
end
