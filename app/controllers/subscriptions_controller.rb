class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @subscriptions = Collection.find(params[:collection_id]).subscriptions

  end
end
