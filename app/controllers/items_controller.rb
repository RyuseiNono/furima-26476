class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy, :edit, :update] # 順番重要
  before_action :user_can_edit?, only: [:destroy, :edit, :update] # 順番重要
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to url: item_path(@item.id)
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :status_id, :category_id, :shipping_cost_id, :prefecture_id, \
                                 :days_to_ship_id, :price).merge(user_id: current_user[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 編集権限がない場合、詳細ページへリダイレクトする
  def user_can_edit?
    redirect_to action: :index unless @item.user_id == current_user.id
  end
end
