class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :rental_period
      t.string :category
      t.decimal :value

      t.timestamps
    end
  end
end
