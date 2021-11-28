class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :title
      t.text :description
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
