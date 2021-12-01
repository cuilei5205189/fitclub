class ChangeQuantityToCartItem < ActiveRecord::Migration[7.0]
  def change
    # change quantity to integer
    change_column :cart_items, :quantity, :integer
  end
end
