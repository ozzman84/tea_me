class Api::V1::Customers::SubscriptionsController < ApplicationController
  def index
    subscriptions = Customer.find(params[:customer_id]).subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.create!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update!(subscription_params)
    render json: subscription, status: 204
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end
