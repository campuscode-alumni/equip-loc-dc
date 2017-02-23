class RemoveCategoryFromEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :category, :string
  end
end
