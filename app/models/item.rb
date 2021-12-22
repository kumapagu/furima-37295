class Item < ApplicationRecord
  VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :name, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :status_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :ship_days_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX }
  validates_inclusion_of :price, in: 300..9_999_999, message: "は¥300〜¥9,999,999で入力してください"
  validates :image, presence: true

  belongs_to :user
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :ship_days
  has_one_attached :image
end
