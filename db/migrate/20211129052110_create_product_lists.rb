class CreateProductLists < ActiveRecord::Migration[7.0]
  def change
    create_table :product_lists do |t|
      t.references :product, null: false, foreign_key: true
      t.string :product_name
      t.integer :product_price
      t.integer :quantity

      t.timestamps
    end
  end
end
