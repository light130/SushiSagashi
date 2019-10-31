class GoodsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    Good.create(user_id: current_user.id, comment_id: comment.id)
    redirect_back(fallback_location: shop_url(shop))
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    Good.destroy(user_id: current_user.id, comment_id: comment.id)
    redirect_back(fallback_location: shop_url(shop))
  end

end
