class AddCategoryRefToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment, :category, foreign_key: true
  end
end
