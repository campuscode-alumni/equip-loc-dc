class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :serial_number
      t.decimal :replacement_value
      t.string :name
      t.text :description
      t.datetime :acquisition_date
      t.string :usage_limit
      t.string :image
      t.string :category
      t.string :manufacturer
      t.string :supplier

      t.timestamps
    end
  end
end
