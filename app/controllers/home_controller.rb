class HomeController < ApplicationController

  def index
    @collections = Collection.with_approval(:unnecessary).limit(10)
  end

end
