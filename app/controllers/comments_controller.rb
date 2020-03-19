class CommentsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    comment = shop.comments.build(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash[:notice] = 'コメントしました。'
      redirect_back(fallback_location: shop_url(shop))
    else
      flash[:alert] = 'コメントできませんでした。'
      redirect_back(fallback_location: shop_url(shop))
    end
  end

  def index
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    comment = shop.comments.find(params[:id])
    if comment.destroy
      flash[:notice] = 'コメントを削除しました。'
      redirect_back(fallback_location: shop_url(shop))
    else
      flash[:alert] = 'コメントを削除できませんでした。'
      redirect_back(fallback_location: shop_url(shop))
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
