class GoodsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    current_user.good(comment)
    redirect_back(fallback_location: shop_url(shop))
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    current_user.normal(comment)
    redirect_back(fallback_location: shop_url(shop))
  end

end
