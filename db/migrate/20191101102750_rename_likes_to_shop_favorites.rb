class RenameLikesToShopFavorites < ActiveRecord::Migration[6.0]
  def change
    rename_table :likes, :shop_favorites
  end
end
