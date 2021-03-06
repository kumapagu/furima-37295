class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_set_params, except: [:index, :new, :create]
  before_action :move_to_top, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :ship_days_id, :price, {images: []}).merge(user_id: current_user.id)
  end

  def item_set_params
    @item = Item.find(params[:id])
  end

  def move_to_top
    redirect_to root_path unless @item.user_id == current_user.id && @item.buy.nil?
  end
end
