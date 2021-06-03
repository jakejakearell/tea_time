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

      get "/api/v1/user/#{@user.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      subscription_json = JSON.parse(response.body, symbolize_names: true)
      expect(subscription_json).to be_a(Hash)
      expect(subscription_json[:data]).to be_a(Array)
      expect(subscription_json[:data].count).to eq(10)

      subscription_json[:data].each do |subscription|
        expect(subscription.keys).to eq([:id, :type, :attributes])
        expect(subscription[:id]).to be_a(String)
        expect(subscription[:type]).to eq('subscriptions')
        expect(subscription[:attributes].count).to eq(3)
        expect(subscription[:attributes].keys).to eq([:title, :price, :frequency])
        expect(subscription[:attributes][:title]).to be_a(String)
        expect(subscription[:attributes][:price]).to be_a(Float)
        expect(subscription[:attributes][:frequency]).to be_a(String)
      end
    end
  end

  describe 'sad path' do

    it "will give error if user doesn't exist" do
      get "/api/v1/user/420/subscriptions"
      expect(response.status).to eq(404)

      message = JSON.parse(response.body, symbolize_names: true)
      expect(message[:error]).to eq("No such user")
    end

    it "will give return an empty array if user has no subscriptions" do
      user = create(:user)
      get "/api/v1/user/#{user.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      subscription_json = JSON.parse(response.body, symbolize_names: true)
      expect(subscription_json).to be_a(Hash)
      expect(subscription_json[:data]).to be_a(Array)
      expect(subscription_json[:data].count).to eq(0)
    end
  end
end
