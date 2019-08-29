class Shop < ApplicationRecord
  belongs_to :user, -> { where admin: true }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate :picture_size
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments


  private

    def picture_size
      if picture.size >  5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
