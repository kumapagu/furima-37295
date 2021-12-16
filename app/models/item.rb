class Item < ApplicationRecord

  belongs_to :user
  extend ActiveHash::Associations
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :ship_day
  has_one_attached :image
end
