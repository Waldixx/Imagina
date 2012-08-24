#@author Oswaldo Didier Lopez Garcia
#24 de Agosto del 2012
#oswaldo@codetlan.com
class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  #Listamos los comentarios de acuerdo al id de la imagen en la que estemos posicionados
  # Nos regresa la respuesta en JS
  def index
    @comments = Comment.find_all_by_image_id(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
      format.js
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  #Listamos los comentarios de acuerdo al id de la imagen en la que estemos posicionados
  def show
    @comments = Comment.find_all_by_image_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  # Nos regresa la respuesta en JS
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
      format.js
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  # Nos regresa la respuesta en JS
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        #Buscamos y listamos todos los comentarios que tengan el image_id con el que fue agregado el comentario
        @comments = Comment.find_all_by_image_id(@comment.image_id)
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  #Nos regresa una respuesta en JS
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #Despues de eliminar buscamos y listamos todos los comentarios de acuerdo al image_id que eliminamos con la finalidad de
    #hacer un refrescado ajax
    @comments = Comment.find_all_by_image_id(@comment.image_id)

    respond_to do |format|
      format.js
    end
  end
end
