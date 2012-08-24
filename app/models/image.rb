#@author Oswaldo Didier Lopez Garcia
#24 de Agosto del 2012
#oswaldo@codetlan.com
class Image < ActiveRecord::Base
  #Realizamos la relacion has many esto quiere decir que la Imagen tiene muchos comentarios
  has_many :comments
  #Hacemos accesibles los atributos del modelo para que se puedan crear nuevas imagenes
  attr_accessible :name, :picture
  #Declaramos que para el atributo picture del modelo imagen va montar un upload debido a que se estaran subiendo imagenes a la app
  mount_uploader :picture, PictureUploader
end
