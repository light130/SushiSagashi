class Shop < ApplicationRecord
  belongs_to :user, -> { where admin: true }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate :picture_size
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def set_coordinates
    geo_result = Geocoder.search(self.address)
    self.latitude = geo_result.first.coordinates[0]
    self.longitude = geo_result.first.coordinates[1]
  end

  private

    def picture_size
      if picture.size >  5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
