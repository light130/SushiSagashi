class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable
  has_many :shops
  validates :name, presence: true
  has_many :likes, dependent: :destroy
  has_many :liked_shops, through: :likes, source: :shop
  has_many :comments

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

end
