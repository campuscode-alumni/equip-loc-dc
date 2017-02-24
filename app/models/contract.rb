class Contract < ApplicationRecord
  validates :customer, :delivery_address, :equipment,
    :rental_period, :amount, :total_amount, :payment_method, :contact, presence: true
    has_one :delivery_receipt
    has_many :equipments
end
