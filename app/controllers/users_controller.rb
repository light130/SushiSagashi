class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def likes
    @shops = current_user.liked_shops.all
  end

end
