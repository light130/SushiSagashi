class Shop < ApplicationRecord

  belongs_to :user, -> { where admin: true }

  mount_uploader :picture, PictureUploader

  geocoded_by :address

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validate :picture_size
  after_validation :geocode, if: :address_changed?

  private

    def picture_size
      if picture.size >  5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
