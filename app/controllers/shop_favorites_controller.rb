class ShopFavoritesController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    ShopFavorite.create(user_id: current_user.id, shop_id: @shop.id)
    # respond_to do |format|
    #   format.html { redirect_to @shop }
    #   format.js
    # end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    shop_favorite = ShopFavorite.find_by(user_id: current_user.id, shop_id: @shop.id)
    shop_favorite.destroy
    # respond_to do |format|
    #   format.html { redirect_to @shop }
    #   format.js
    # end
  end
end
