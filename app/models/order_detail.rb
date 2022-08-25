class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum making_status: {
  cannot_start: 0,
  waiting_start: 1,
  in_production: 2,
  completed: 3}
end
