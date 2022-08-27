class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  def sum_of_price
     item.add_tax_price * amount
 end
  enum making_status: {
  cannot_start: 0,
  waiting_start: 1,
  in_production: 2,
  completed: 3}
end
 