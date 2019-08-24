class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]

  def new
    @shop = current_user.shops.build
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = current_user.shops.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
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

  def destroy
    Shop.find(params[:id]).destroy
    flash[:notice] = "削除しました。"
    redirect_to root_url
  end

  private

   def shop_params
     params.require(:shop).permit(:name, :address, :budget, :opening_hours, :picture)
   end

   def admin_user
     redirect_to root_url unless current_user.admin?
   end

end
