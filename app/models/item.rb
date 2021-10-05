class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :caegory
  belongs_to :condition
  belongs_to :Shipping_area
  belongs_to :shipping_charges
  belongs_to :shipping_days

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :Shipping_area_id, numericality: { other_than: 1 } 
  validates :shipping_charges_id, numericality: { other_than: 1 } 
  validates :shipping_days_id, numericality: { other_than: 1 } 
end
