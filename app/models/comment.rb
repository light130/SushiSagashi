class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  has_many :comment_favorites, dependent: :destroy
  has_many :comment_favorite_users, through: :comment_favorites, source: :user

  validates :content, presence: true
end
