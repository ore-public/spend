class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_subscriptions, only: [:approve, :reject]

  def index
    @subscriptions = Collection.find(params[:collection_id]).subscriptions

  end

  def approve
    @subscription.status = :read
    @subscription.save

    redirect_to collection_subscriptions_path, {notice: I18n.t('collections.subscriptions.message.approve')}
  end

  def reject
    @subscription.status = :reject
    @subscription.save

    redirect_to collection_subscriptions_path, {notice: I18n.t('collections.subscriptions.message.reject')}
  end

  private
  def find_subscriptions
    @subscription = Collection.find(params[:collection_id]).subscriptions.find(params[:id])

  end
end
