class AddEquipmentRefToContract < ActiveRecord::Migration[5.0]
  def change
    add_reference :contracts, :equipment, foreign_key: true
  end
end
