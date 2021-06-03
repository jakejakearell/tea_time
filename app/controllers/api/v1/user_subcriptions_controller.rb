class Api::V1::UserSubcriptionsController < ApplicationController

  def create
    subscription = UserSubscription.create(user_subcription_params)
    if subscription.save
      subscription.update(active: true)
      render json: UserSubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: subscription.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def update
    subscription = UserSubscription.find_by(user_id: user_id, subscription_id: subscription_id)
    if subscription
      subscription.update_status(status)
      render json: UserSubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: "No record"}, status: :bad_request
    end
  end

  private

  def status
    params[:active]
  end

  def user_id
    params[:user_id]
  end

  def subscription_id
    params[:subscription_id]
  end

  def user_subcription_params
    params.permit(:user_id, :subscription_id)
  end
end
