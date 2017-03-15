class Contract < ApplicationRecord
  validates :customer, :delivery_address,
    :rental_period, :amount, :total_amount, :payment_method, :contact, presence: true

    belongs_to :customer
    has_one :delivery_receipt
    has_one :return_receipt

    has_many :rented_equipments
    has_many :equipment, through: :rented_equipments

    enum status: [ :active , :finished ]

    def list
      equipment_list = []
      self.equipment.each do |equipment|
        equipment_list << equipment.name
      end
      equipment_list.join(", ")
    end

    
end
