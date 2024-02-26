class OrdersController < ApplicationController

  def index
    @purchase_record = PurchaseRecord.new
  end

  def create
    # binding.pry
  end
end
