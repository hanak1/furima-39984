require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it 'product_name、product_detail、category_id、product_condition_id、shipping_fee_id、region_of_shipping_origin_id、estimated_delivery_date_id、price、userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_detailが空では登録できない' do
        @item.product_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product detail can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_condition_idが空では登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'region_of_shipping_origin_idが空では登録できない' do
        @item.region_of_shipping_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of shipping origin can't be blank")
      end
      it 'estimated_delivery_date_idが空では登録できない' do
        @item.estimated_delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated delivery date can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
      end
      it 'userがログインしていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'Price は¥300未満¥1000000以上であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'Price は¥300未満¥1000000以上であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'Price は半角数値でなければ登録できない' do
        @item.price = 'aA１２'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
