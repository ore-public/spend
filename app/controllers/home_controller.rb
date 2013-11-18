class HomeController < ApplicationController

  def index
    @collections = Collection.with_authentication(:unnecessary).limit(10)
  end

end
