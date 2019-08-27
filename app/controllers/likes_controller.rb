class LikesController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    current_user.like(shop)
    flash[:notice] = "お気に入り登録をしました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    current_user.unlike(shop)
    flash[:notice] = "お気に入りから外しました。"
    redirect_back(fallback_location: root_path)
  end

end
