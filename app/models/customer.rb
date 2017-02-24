class Customer < ApplicationRecord
  validates :name, presence: true
  validates :legal_name, presence: true
  validates :customer_type, presence: true
  validates :contact_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :document, presence: true
  has_many :contracts
end
