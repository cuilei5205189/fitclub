class ChangeUserIdNullableToCart < ActiveRecord::Migration[7.0]
  def change
    change_column_null :carts, :user_id, true
  end
end
