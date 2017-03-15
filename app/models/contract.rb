class Contract < ApplicationRecord

  validates :customer, :delivery_address, :amount,
            :total_amount, :payment_method, :contact, presence: true

  validates :total_amount, numericality: {greater_than_or_equal_to: 0}

  before_validation :calculate_total_value

  before_save :set_end_date

  has_one :return_receipt

  belongs_to :customer
  has_one :delivery_receipt

  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments

  def calculate_total_value
    self.amount = 0
    equipment.each do |equipment|
      price = equipment.category.prices.find_by(rental_period: self.rental_period)
      self.amount += price.value
    end
    if amount  > 0
      self.total_amount = amount - discount
    end
  end

  def list
    equipment_list = []
    self.equipment.each do |equipment|
      equipment_list << equipment.name
    end
    equipment_list.join(", ")
  end

    def set_end_date
      self.end_date = start_date + rental_period.to_i.days
    end
end
