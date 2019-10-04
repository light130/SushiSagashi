class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :shop

  has_many :goods, dependent: :destroy
  has_many :user_goods, through: :goods, source: :user

  validates :content, presence: true

end
