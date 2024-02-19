class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end

private

  def item_params
    params.require(:item).permit(:product_name, :product_detail, :product_condition_id, :shipping_fee_id, :region_of_shipping_origin_id, :estimated_delivery_date_id, :price, :image, :category_id).merge(user_id: current_user.id)
  end

end