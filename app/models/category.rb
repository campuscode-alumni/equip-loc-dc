class Category < ApplicationRecord

  has_many :equipment

  has_many :prices
end
