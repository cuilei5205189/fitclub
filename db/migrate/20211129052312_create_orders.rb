class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.references :user, null: false, foreign_key: true
      t.string :billing_name
      t.string :billing_address
      t.string :shipping_name
      t.string :shipping_address
      t.string :phone_number
      t.string :token
      t.boolean :is_paid
      t.string :payment_method

      t.timestamps
    end
  end
end
