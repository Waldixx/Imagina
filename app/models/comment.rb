#@author Oswaldo Didier Lopez Garcia
#24 de Agosto del 2012
#oswaldo@codetlan.com
class Comment < ActiveRecord::Base
  #Le decimos que los comentarios pertenecen a una imagen
  belongs_to :image
  #Hacemos accesibles los atributos del modelo para que se puedan crear nuevos comentarios
  attr_accessible :image_id, :text
end
