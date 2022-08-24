class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  
  has_one_attached :image
  
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  validates :excluding_tax_price, presence: true
  validates :is_active, presence: true
  
end
