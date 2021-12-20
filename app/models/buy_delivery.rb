class BuyDelivery
  include ActiveModel::Model
  att_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :buy_id

  