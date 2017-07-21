class Post < ApplicationRecord
  belongs_to :asignatura
  mount_uploader :image, ImageUploader
  validate :image_size_validation

private
  def image_size_validation
    errors[:image] << "should be less than 10MB" if image.size > 10.megabytes
  end
end
