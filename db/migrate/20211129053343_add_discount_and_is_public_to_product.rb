class AddDiscountAndIsPublicToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount, :integer
    add_column :products, :is_public, :boolean
  end
end
