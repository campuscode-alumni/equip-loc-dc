class Contract < ApplicationRecord
  validates :customer, :delivery_address, :rental_period, :amount,
            :total_amount, :payment_method, :contact, presence: true

  before_save :calculate_total_value

  belongs_to :customer
  has_one :delivery_receipt
  belongs_to :rental_period

  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments

  def calculate_total_value
    self.amount = 0
    equipment.each do |equipment|
      price = equipment.category.price.where(rental_period: rental_period)
    end

  end

  def list
    equipment_list = []
    self.equipment.each do |equipment|
      equipment_list << equipment.name
    end
    equipment_list.join(", ")
  end
end
