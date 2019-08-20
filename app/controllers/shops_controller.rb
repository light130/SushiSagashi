class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def new
    @shop = current_user.shops.build
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to root_url
    else
      flash[:errors] = ["あなたは店舗を登録する権利がありません。"]
      render 'shops/new'
    end
  end

  def destroy
    @shop.destroy
    redirect_back(fallback_location: root_url)
  end

  private

  def correct_user
    @shop = current_user.shops.find_by(id: params[:id])
    redirect_to root_url if @shop.nil?
   end

   def shop_params
     params.require(:shop).permit(:name, :address, :budget, :opening_hours, :picture)
   end

end
