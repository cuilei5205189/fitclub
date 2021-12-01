class ChangeQuanityToIntegerToCartItems < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_items, :quantity, :integer, using: 'quantity::integer'
  end
end
