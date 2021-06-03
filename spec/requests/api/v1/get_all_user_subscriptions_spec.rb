require 'rails_helper'

RSpec.describe 'User subscription' do
  describe 'happy path' do
    before :each do
      @user = create(:user)
      subscriptions = create_list(:subscription, 10)
      subscriptions.each do |subscription|
        create(:user_subscription, user: @user, subscription: subscription)
      end
    end

    it "can add a subscription to an existing user" do
      require "pry"; binding.pry
      get "/api/v1/user/#{@user.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")

      subscription_json = JSON.parse(response.body, symbolize_names: true)

    end
  end

  describe 'sad path' do

    it "will give error if user doesn't exist" do

    end

    it "will give return an empty array if user has no subscriptions" do

    end
  end
end
