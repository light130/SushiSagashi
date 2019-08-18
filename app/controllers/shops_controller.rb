class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def new
  end

  def create
    @shop = current_user.shops.build
    if @shop.save
      redirect_to root_url
    else
      render 'shops/new'
    end
  end

  def destroy
    @shop.destroy
    redirect_back(fallback_location: root_url)
  end

  def correct_user
    @shop = current_user.shops.find_by(id: params[:id])
    redirect_to root_url if @shop.nil?
  end

end
