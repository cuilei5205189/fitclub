class ChangeQuantityToCartItem < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :cart_items, :quantity, :integer
    end

    def down
      change_column :cart_items, :quantity, :integer
    end
  end
end
