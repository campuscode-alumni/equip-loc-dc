class AddRentToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :rent, :boolean
  end
end
