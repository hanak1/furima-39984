FactoryBot.define do
  factory :item do
    product_name                     { 'スマホ' }
    product_detail                    { 'アイフォンです' }
    category_id                       {2}
    product_condition_id              {2}
    shipping_fee_id                   {2}
    region_of_shipping_origin_id      {2}
    estimated_delivery_date_id        {2}
    price                             {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
