class LikesController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    Like.create(user_id: current_user.id, shop_id: @shop.id)
    respond_to do |format|
      format.html { redirect_to @shop }
      format.js
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    Like.destroy(user_id: current_user.id, shop_id: @shop.id)
    respond_to do |format|
      format.html { redirect_to @shop }
      format.js
    end
  end

end
