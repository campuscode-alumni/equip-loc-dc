class Price < ApplicationRecord

  validates :rental_period, :category, :value, presence: true

end
