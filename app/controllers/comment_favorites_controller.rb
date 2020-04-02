class CommentFavoritesController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    CommentFavorite.create(user_id: current_user.id, comment_id: comment.id)
    redirect_back(fallback_location: shop_url(shop))
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    comment_favorite = CommentFavorite.find_by(user_id: current_user.id, comment_id: comment.id)
    comment_favorite.destroy
    redirect_back(fallback_location: shop_url(shop))
  end
end
