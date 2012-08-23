class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    @comments = Comment.find_all_by_image_id(params[:id])
    logger.debug(@comments)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
      format.js
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comments = Comment.find_all_by_image_id(params[:id])
    logger.debug(@comments)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @images = Image.new(params[:image_id])
    logger.debug(@images)

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
  def create
    @image = Image.new(params[:id])
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
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
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comments = Comment.find_all_by_image_id(@comment.image_id)

    respond_to do |format|
      #format.html { redirect_to '/images'}
      #format.json { head :no_content }
      format.js
    end
  end
end
