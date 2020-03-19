class Category < ApplicationRecord
  mount_uploader :image, ImageCategoryUploader
  validates :name, presence: true
  has_many :adverts
  has_ancestry
end
