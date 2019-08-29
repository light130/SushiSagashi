class CommentsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = shop.comments.build(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash[:notice] = "コメントしました。"
      redirect_back(fallback_location: shop_url(shop))
    else
      flash[:alert] = "コメントできませんでした。"
      redirect_back(fallback_location: shop_url(shop))
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
