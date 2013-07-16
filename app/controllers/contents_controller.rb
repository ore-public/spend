class ContentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_contents, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /contents
  # GET /contents.json
  def index
    @contents = current_user.collections.find(params[:collection_id]).contents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = current_user.collections.find(params[:collection_id]).contents.new(collection_id: params[:collection_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = current_user.collections.find(params[:collection_id]).contents.new(params[:content])

    respond_to do |format|
      if @content.save
        format.html { redirect_to collection_content_url(@content.collection_id, @content), notice: 'Content was successfully created.' }
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to collection_content_url(@content.collection_id, @content), notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy

    respond_to do |format|
      format.html { redirect_to collection_contents_url(params[:collection_id]) }
      format.json { head :no_content }
    end
  end

  private
  def find_contents
    @content = current_user.collections.find(params[:collection_id]).contents.find(params[:id])
  end
end
