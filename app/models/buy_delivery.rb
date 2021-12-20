class BuyDelivery
  include ActiveModel::Model
  att_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :buy_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :buy_id
  end