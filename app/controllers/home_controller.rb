#@author Oswaldo Didier Lopez Garcia
#24 de Agosto del 2012
#oswaldo@codetlan.com
class HomeController < ApplicationController
  #Este metodo se manda a llamar para el index que estamos mostrando en nuestra aplicacion y a su vez le debemos de
  #pasar la lista de imagenes, de comentarios y se crean los modelos imagenes y comentarios para poder mostrarlos en el index
  def index
    @images = Image.all
    @image = Image.new
    @comments = Comment.find_all_by_image_id(1)
    @comment = Comment.new
  end
end
