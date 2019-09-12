class HomeController < ApplicationController

  def index
    if params[:q].present?
      @q = Shop.ransack(search_params)
      @shops_result = @q.result
    else
      params[:q] = { sorts: 'id desc' }
      @q = Shop.ransack()
      @shops_result = Shop.all
    end
  end

  def search_params
    params.require(:q).permit(:address_cont, :sorts)
  end

end
