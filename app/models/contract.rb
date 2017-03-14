class Contract < ApplicationRecord
  before_save :set_end_date

  validates :customer, :delivery_address,
    :rental_period, :amount, :total_amount, :payment_method, :contact, presence: true

    belongs_to :customer
    has_one :delivery_receipt
    has_one :return_receipt

    has_many :rented_equipments
    has_many :equipment, through: :rented_equipments


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
