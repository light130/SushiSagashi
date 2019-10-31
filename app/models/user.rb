class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  mount_uploader :avatar, PictureUploader

  has_many :shops
  with_options dependent: :destroy do |assoc|
    assoc.has_many :likes
    assoc.has_many :comments
    assoc.has_many :goods
  end
  has_many :liked_shops, through: :likes, source: :shop
  has_many :has_goods, through: :goods, source: :comment

  validates :name, presence: true

  def like?(shop)
    liked_shops.include?(shop)
  end

  def good?(comment)
    has_goods.include?(comment)
  end

end
