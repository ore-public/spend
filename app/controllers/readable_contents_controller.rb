class ReadableContentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    collection = Collection.find(params[:collection_id])
    if collection.read?(current_user)
      @contents = collection.contents
    else
      raise CanCan::AccessDenied.new("readable_collections", :read, Content)
    end

  end

  def show
    collection = Collection.find(params[:collection_id])
    if collection.read?(current_user)
      @content = collection.contents.find(params[:id])
    else
      raise CanCan::AccessDenied.new("readable_collections", :read, Content)
    end
  end
end
