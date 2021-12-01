class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.text :summary
      t.string :article_image
      t.string :is_hidden

      t.timestamps
    end
  end
end
