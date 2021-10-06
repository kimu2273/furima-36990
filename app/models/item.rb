class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_charges
  belongs_to :shipping_days
  has_one_attached :image
  belongs_to :user

  validates :name, :explanation, :price, :image, presence: true
  validates :price, numericality: {in: 300..9999999, message: "is out of setting range"}, format: {with: /\A(?=.*?[\d])+\z/i, message: "is invalid. Input half-width characters"}
  validates :category_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, numericality:  { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charges_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :shipping_days_id, numericality:  { other_than: 1 , message: "can't be blank"}
end
