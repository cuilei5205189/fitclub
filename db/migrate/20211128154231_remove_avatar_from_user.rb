class RemoveAvatarFromUser < ActiveRecord::Migration[7.0]
  def change
    # remove avatar
    remove_column :users, :avatar
  end
end
