class Order < ApplicationRecord
  enum status: {
  waiting_payment: 0,
  payment_confirmation: 1,
  in_production: 2,
  発送準備中: 3,
  発送済み: 4}

  enum payment_method: {
  クレジットカード: 0,
  銀行振込: 1}

  belongs_to :customer
  has_many :order_details, dependent: :destroy
end
