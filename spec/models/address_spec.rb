require 'rails_helper'

RSpec.describe Address, type: :model do
  # before do
  #   @address = FactoryBot.build(:address)
  # end

  # describe '住所の登録' do
  #   context '住所の登録ができるとき' do
  #     it 'zip_code, region_of_shipping_origin_id, city, street_address, apartment_name, tel, purchase_recordがあれば登録できる' do
  #       expect(@address).to be_valid
  #     end
  #   end
    
  #   context '住所の登録ができないとき' do
  #     it 'zip_codeが空では登録できない' do
  #       @address.zip_code = ''
  #       @address.valid?
  #       binding.pry
  #       expect(@address.errors.full_messages).to include("")
  #     end
  #     it 'zip_codeが「-」がなければ登録ができない' do
  #       @address.zip_code = '1234567'
  #       @address.valid?
  #       expect(@address.errors.full_messages).to include("")
  #     end
  #     it 'region_of_shipping_origin_idに「---」が選択されている場合は登録ができない'
  #       @address.region_of_shipping_origin_id = 1
  #       @address.valid?
  #       expect(@address.full_messages).to include("Region of shipping origin --- can't choose")
  #     end
  #     it 'cityが空では登録できない' do
  #       @address.zip_code = ''
  #       @address.valid?
  #       expect(@address.errors.full_messages).to include("")
  #     end
  #     it 'street_addressが空では登録できない' do
  #       @address.zip_code = ''
  #       @address.valid?
  #       expect(@address.errors.full_messages).to include("")
  #     end
  #     it 'telが空では登録できない' do
  #       @address.zip_code = ''
  #       @address.valid?
  #       expect(@address.errors.full_messages).to include("")
  #     end
  #   end
  end

