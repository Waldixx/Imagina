class Comment < ActiveRecord::Base
  belongs_to :image

  attr_accessible :image_id, :text
end
