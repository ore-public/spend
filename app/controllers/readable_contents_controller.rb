class ReadableContentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @contents = Collection.find(params[:collection_id]).contents
  end
end
