class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to url: root_path
    else
      render action: :new
    end
  end

  def show
    @item = Item.includes(:user).find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    user_can_edit?
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :status_id, :category_id, :shipping_cost_id, :prefecture_id, \
                                 :days_to_ship_id, :price).merge(user_id: current_user[:id])
  end

  # 編集権限がない場合、詳細ページへリダイレクトする
  def user_can_edit?
    redirect_to action: :index unless @item.user_id == current_user.id
  end
end
