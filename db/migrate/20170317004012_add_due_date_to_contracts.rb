class AddDueDateToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :due_date, :date
  end
end
