class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :name, :picture, presence: true
  validate :picture_size 

  private
  def picture_size
    if picture.size > 5.megabytes 
      errors.add(:picture, "Should be less than 5MB.")
    end
  end
  
end
