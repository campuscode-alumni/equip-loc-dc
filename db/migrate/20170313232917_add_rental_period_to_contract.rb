class AddRentalPeriodToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :rental_period, :integer
  end
end
