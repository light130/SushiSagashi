class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  mount_uploader :avatar, PictureUploader

  has_many :shops
  with_options dependent: :destroy do |assoc|
    assoc.has_many :shop_favorites
    assoc.has_many :comments
    assoc.has_many :comment_favorites
  end
  has_many :liked_shops, through: :shop_favorites, source: :shop
  has_many :has_comment_favorites, through: :comment_favorites, source: :comment

  validates :name, presence: true

  def like?(shop)
    liked_shops.include?(shop)
  end

  def comment_favorite?(comment)
    has_comment_favorites.include?(comment)
  end

end
