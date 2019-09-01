class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable
  has_many :shops
  validates :name, presence: true
  has_many :likes, dependent: :destroy
  has_many :liked_shops, through: :likes, source: :shop
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, PictureUploader
  has_many :goods, dependent: :destroy
  has_many :has_goods, through: :goods, source: :comment

  def like(shop)
    likes.create(shop_id: shop.id)
  end

  def unlike(shop)
    like = likes.find_by(shop_id: shop.id)
    like.destroy
  end

  def like?(shop)
    liked_shops.include?(shop)
  end

  def good(comment)
    goods.create(comment_id: comment.id)
  end

  def normal(comment)
    good = goods.find_by(comment_id: comment.id)
    good.destroy
  end

  def good?(comment)
    has_goods.include?(comment)
  end

end
