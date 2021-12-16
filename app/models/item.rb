class Item < ApplicationRecord

  validates :name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :ship_days_id, presence: true
  validates :price, presence: true
  validates_inclusion_of :price, in:300..9999999
  validates :user_id, presence: true
  validates :image, presence: true


  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :ship_day
  has_one_attached :image
end
