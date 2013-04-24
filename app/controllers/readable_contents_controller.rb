class ReadableContentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    collection = Collection.find(params[:collection_id])
    if collection.read?(current_user)
      @contents = collection.contents
    else

    end

  end
end