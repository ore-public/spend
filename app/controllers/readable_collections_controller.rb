class ReadableCollectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @collections = Collection.all
  end

  def read
    @collection = Collection.find(params[:id])

    subscription = Subscription.new
    subscription.collection = @collection
    subscription.user = current_user
    subscription.status = if @collection.approval.necessary?
                            :offer
                          else
                            :read
                          end
    if @collection.owner == current_user
      subscription.status = :read
    end

    subscription.save

    redirect_to readable_collections_path, {notice: I18n.t('collections.message.request_read')}
  end
end
