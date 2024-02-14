class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end

private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_user_session
    unless  user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :product_detail, :product_condition_id, :shipping_fee_id, :region_of_shipping_origin_id, :estimated_delivery_date_id, :price, :image, :category_id).merge(user_id: current_user.id)
  end

end