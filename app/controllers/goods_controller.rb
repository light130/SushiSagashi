class GoodsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    current_user.good(comment)
    respond_to do |format|
      format.html { redirect_to @shop }
      format.js
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    comment = Comment.find(params[:comment_id])
    current_user.normal(comment)
    respond_to do |format|
      format.html { redirect_to @shop }
      format.js
    end
  end

end
