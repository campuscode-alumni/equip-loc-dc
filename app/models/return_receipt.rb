class ReturnReceipt < ApplicationRecord

  validates :employee_contact, :document, presence: true

  belongs_to :contract
end
