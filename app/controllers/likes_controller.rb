class LikesController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    current_user.like(@shop)
    respond_to do |format|
      format.html { redirect_to @shop }
      format.js
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    current_user.unlike(@shop)
    respond_to do |format|
      format.html { redirect_to @shop }
      format.js
    end
  end

end
