class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
  end


  private

  def item_params
    paramas.repuire(:item).permit(:name, :item_description, :cotegory_id, :status_id, :delivery_charge_id, :prefecture_id, :ship_days_id).merge(user_id: current_user.id)
  end
end
