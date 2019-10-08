class Shop < ApplicationRecord

  belongs_to :user, -> { where admin: true }

  mount_uploader :picture, PictureUploader

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validate :picture_size

  private

    def picture_size
      if picture.size >  5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
