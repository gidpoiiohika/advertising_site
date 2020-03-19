class Advert < ApplicationRecord
  after_update :crop_image

  mount_uploader :image, ImageUploader
  # mount_uploaders :attachments, ImageUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :user
  belongs_to :category

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
