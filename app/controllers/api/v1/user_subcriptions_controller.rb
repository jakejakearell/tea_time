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

  private

  def user_subcription_params
    params.permit(:user_id, :subscription_id)
  end
end
