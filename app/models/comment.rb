class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :content, presence: true
  has_many :goods, dependent: :destroy
  has_many :user_goods, through: :goods, source: :user

end
