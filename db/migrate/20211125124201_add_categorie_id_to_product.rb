class AddCategorieIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :categorie, null: false, foreign_key: true
  end
end
