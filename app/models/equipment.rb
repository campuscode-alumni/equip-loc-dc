class Equipment < ApplicationRecord

  validates :serial_number, :name, :description, :acquisition_date, :replacement_value,
            :usage_limit, :image, :category, :manufacturer, :supplier, presence: true

  validates :replacement_value, numericality: {greater_than: 0}
end
