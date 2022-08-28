class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :item_id,       presence: true
  validates :customer_id,   presence: true
  validates :amount,        presence: true, numericality: true

 def sum_of_price
     item.add_tax_price * amount
 end
end