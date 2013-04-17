class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @subscriptions = Collection.find(params[:collection_id]).subscriptions

  end

  def approve
    subscription = Collection.find(params[:collection_id]).subscriptions.find(params[:id])
    subscription.status = :read
    subscription.save

    redirect_to collection_subscriptions_path, {notice: I18n.t('collections.subscriptions.message.approve')}
  end

  def reject
    subscription = Collection.find(params[:collection_id]).subscriptions.find(params[:id])
    subscription.status = :reject
    subscription.save

    redirect_to collection_subscriptions_path, {notice: I18n.t('collections.subscriptions.message.reject')}
  end


end
