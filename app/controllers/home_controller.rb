class HomeController < ApplicationController

  def index
    @q = Shop.ransack(params[:q])
    @shops_result = @q.result(distinct: true)
  end

end
