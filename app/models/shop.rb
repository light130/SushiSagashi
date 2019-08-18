class Shop < ApplicationRecord
  belongs_to :user, -> { where admin: true }
  validates :user_id, presence: true
end
