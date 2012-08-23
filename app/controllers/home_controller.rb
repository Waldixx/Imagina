class HomeController < ApplicationController
  def index
    @images = Image.all
    @image = Image.new
    @comments = Comment.find_all_by_image_id(1)
    @comment = Comment.new
  end
end
