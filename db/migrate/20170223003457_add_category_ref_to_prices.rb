class AddCategoryRefToPrices < ActiveRecord::Migration[5.0]
  def change
    add_reference :prices, :category, foreign_key: true
  end
end
