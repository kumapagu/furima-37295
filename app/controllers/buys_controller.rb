class BuysController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :move_top, only:[:index]
  before_action :set_item
  def index
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      set_payjp
      @buy_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy_delivery).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_top
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @item.buy.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_payjp
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: "jpy"
      )
  end

end
