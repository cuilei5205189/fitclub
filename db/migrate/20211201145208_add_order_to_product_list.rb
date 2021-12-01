class AddOrderToProductList < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_lists, :order, null: false, foreign_key: true
  end
end
