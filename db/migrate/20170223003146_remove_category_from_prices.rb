class RemoveCategoryFromPrices < ActiveRecord::Migration[5.0]
  def change
    remove_column :prices, :category, :string
  end
end
