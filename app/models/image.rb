class Image < ActiveRecord::Base
  has_many :comments

  attr_accessible :name, :picture
  mount_uploader :picture, PictureUploader
end
