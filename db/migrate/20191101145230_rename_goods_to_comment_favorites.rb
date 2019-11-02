class RenameGoodsToCommentFavorites < ActiveRecord::Migration[6.0]
  def change
    rename_table :goods, :comment_favorites
  end
end
