class CreateReturnReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :return_receipts do |t|
      t.datetime :date
      t.references :contract, foreign_key: true
      t.string     :document
      t.string     :employee_contact

      t.timestamps
    end
  end
end
