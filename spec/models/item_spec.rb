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
      it 'category_idに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category --- can't choose")
      end
      it 'product_condition_idに「---」が選択されている場合は出品できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition --- can't choose")
      end
      it 'shipping_fee_idに「---」が選択されている場合は出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee --- can't choose")
      end
      it 'region_of_shipping_origin_idに「---」が選択されている場合は出品できない' do
        @item.region_of_shipping_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of shipping origin --- can't choose")
      end
      it 'estimated_delivery_date_idに「---」が選択されている場合は出品できない' do
        @item.estimated_delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated delivery date --- can't choose")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number", "Price can't be blank", "Price is invalid")
      end
      it 'userがログインしていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'Price は¥300未満¥1000000以上であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'Price は¥300未満¥1000000以上であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'Price は半角数値でなければ登録できない' do
        @item.price = 'aA１２'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number", "Price is invalid")
      end
      it 'image が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
