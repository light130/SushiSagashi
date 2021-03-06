class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]

  def new
    @shop = current_user.shops.build
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to root_url
    else
      render 'shops/new'
    end
  end

  def update
    @shop = current_user.shops.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = '情報を更新しました。'
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.all
    @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.infowindow shop.name
    end
  end

  def destroy
    @shop = current_user.shops.find(params[:id])
    @shop.destroy
    flash[:notice] = '削除しました。'
    redirect_to root_url
  end

  private

   def shop_params
     params.require(:shop).permit(:name, :address, :latitude, :longitude, :phone_number, :budget_lunch, :budget_dinner, :opening_hours, :day_off, :picture)
   end

   def admin_user
     redirect_to root_url unless current_user.admin?
   end
end
