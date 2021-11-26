class AddIsAdminAndAvatarAndAddressAndNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :avatar, :string
    add_column :users, :address, :string
    add_column :users, :name, :string
  end
end
