class OrdersController < ApplicationController

    before_action :authenticate_user!
    # 商品購入ページへ遷移するとトップページに遷移
    before_action :set_item, only: [:index, :create]
    before_action :go_for_index, only: [:create, :index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_record = PurchaseRecord.new
  end

   def create
      @purchase_record = PurchaseRecord.new(purchase_record_params)
      if @purchase_record.valid?
        pay_item
        @purchase_record.save
            redirect_to root_path
       else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
         render :index, status: :unprocessable_entity
       end
   end

  private

   def purchase_record_params
     params.require(:purchase_record).permit(:price, :zip_code, :region_of_shipping_origin_id, :city, :street_address, :apartment_name, :tel).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
   end

   def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_record_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def go_for_index
       if current_user.id == @item.user_id || @item.order.present?
         redirect_to root_path
       end
     end
    
     def set_item
        @item = Item.find(params[:item_id])
     end
end