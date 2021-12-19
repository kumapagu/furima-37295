class Item < ApplicationRecord
  VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :name, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_days_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX }
  validates_inclusion_of :price, in: 300..9_999_999
  validates :image, presence: true

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :ship_days
  has_one_attached :image
end
