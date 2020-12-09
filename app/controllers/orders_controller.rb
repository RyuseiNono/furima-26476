class OrdersController < ApplicationController
  def new
  end

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end
end
