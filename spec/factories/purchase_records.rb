FactoryBot.define do
  factory :purchase_record do
    zip_code                          { '123-4567' }
    region_of_shipping_origin_id      { 3 }
    city                              {'あいうえお'}
    street_address                    {'かきくけこ'}
    apartment_name                    {'さしす'}
    tel                               {'00000000000'}
    token                             {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end