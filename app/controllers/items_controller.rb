class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  # new,edit,destroyするにはログインの意味
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  # private内に意味を定義済み
  before_action :move_to_index, only: [:edit, :update, :destroy]
  

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:product_name, :product_detail, :product_condition_id, :shipping_fee_id, :region_of_shipping_origin_id, :estimated_delivery_date_id, :price, :image, :category_id).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end