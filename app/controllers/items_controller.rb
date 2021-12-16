class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    binding.pry
  end


  private

  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :ship_days_id, :price).merge(user_id: current_user.id)
  end
end
