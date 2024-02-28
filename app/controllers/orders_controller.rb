class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseRecord.new
  end

  def create
     @purchase_record = PurchaseRecord.new(purchase_record_params)
     if @purchase_record.valid?
           @purchase_record.save(purchase_record_params,current_user.id)
             redirect_to root_path
      else
        render :index, status: :unprocessable_entity
     end
  end

  private

   def purchase_record_params
     params.require(:purchase_record).permit(:zip_code, :region_of_shipping_origin_id, :city, :street_address, :apartment_name, :tel)
   end
end