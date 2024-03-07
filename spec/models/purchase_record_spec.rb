require 'rails_helper'

RSpec.describe PurchaseRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item =  FactoryBot.create(:item)
    @purchase_record = FactoryBot.build(:purchase_record, user_id: user.id, item_id: item.id)
  end

  describe '商品購入情報の保存' do

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'zip_codeが空では登録できない' do
        @purchase_record.zip_code = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが「-」がなければ登録ができない' do
        @purchase_record.zip_code = '1234567'
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Zip code を入力してください")
      end
      it 'region_of_shipping_origin_idに「---」が選択されている場合は登録ができない' do
        @purchase_record.region_of_shipping_origin_id = 1
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Region of shipping origin --- can't choose")
      end
      it 'cityが空では登録できない' do
        @purchase_record.city = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では登録できない' do
        @purchase_record.street_address = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telが空では登録できない' do
        @purchase_record.tel = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは10桁以上11桁以内の半角数値のみ保存可能' do
        @purchase_record.tel = '123-456789'
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Tel is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchase_record.token = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end