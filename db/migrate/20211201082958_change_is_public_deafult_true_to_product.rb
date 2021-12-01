class ChangeIsPublicDeafultTrueToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :is_public, true
  end
end
