class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :customer
      t.string :delivery_address
      t.string :equipment
      t.string :rental_period
      t.float :amount
      t.float :discount
      t.float :total_amount
      t.string :payment_method
      t.string :contact

      t.timestamps
    end
  end
end
