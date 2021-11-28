class CreateClubVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :club_votes do |t|
      t.references :user, null: true, foreign_key: true
      t.references :club, null: true, foreign_key: true

      t.timestamps
    end
  end
end
