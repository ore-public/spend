class MypageController < ApplicationController
  def index
    @managed_collections = Collection.managed(current_user).order("created_at desc").limit(10)
  end
end
