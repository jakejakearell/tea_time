require 'rails_helper'

RSpec.describe 'Update subscription' do
  describe 'happy path' do
    before :each do
      @user = create(:user)
      @subscription = create(:subscription)
      @user_subcription = create(:user_subscription, user: @user, subscription: @subscription)
    end

    it "can add a subscription to an existing user" do
      subscription_info = {
                            user_id: @user.id,
                            subscription_id: @subscription.id,
                            active: false
                          }

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      put '/api/v1/subscription', headers: headers, params: subscription_info.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")

      subscription_json = JSON.parse(response.body, symbolize_names: true)

      expect(subscription_json).to be_a(Hash)
      expect(subscription_json[:data]).to be_a(Hash)
      expect(subscription_json[:data].keys).to eq([:id, :type, :attributes])
      expect(subscription_json[:data][:id]).to be_a(String)
      expect(subscription_json[:data][:type]).to eq('user_subscription')
      expect(subscription_json[:data][:attributes].count).to eq(3)
      expect(subscription_json[:data][:attributes].keys).to eq([:user_id, :subscription_id, :active])
      expect(subscription_json[:data][:attributes][:active]).to eq(false)
      expect(subscription_json[:data][:attributes][:user_id]).to eq(@user.id)
      expect(subscription_json[:data][:attributes][:subscription_id]).to eq(@subscription.id)
    end
  end

  describe 'sad path' do
    before :each do
      @user = create(:user)
      @subscription = create(:subscription)
      @user_subcription = create(:user_subscription, user: @user, subscription: @subscription)
    end

    it "will give error if user doesn't exist" do
      subscription_info = {
                            user_id: "Mike Jones",
                            subscription_id: @subscription.id
                          }

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      put '/api/v1/subscription', headers: headers, params: subscription_info.to_json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      subscription_json = JSON.parse(response.body, symbolize_names: true)
      expect(subscription_json.keys).to eq([:error])
      expect(subscription_json[:error]).to eq("No record")
    end

    it "will give error if subscription doesn't exist" do
      subscription_info = {
                            user_id: @user.id,
                            subscription_id: 12312
                          }

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      put '/api/v1/subscription', headers: headers, params: subscription_info.to_json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      subscription_json = JSON.parse(response.body, symbolize_names: true)
      expect(subscription_json.keys).to eq([:error])
      expect(subscription_json[:error]).to eq("No record")

    end

    it "will not update activity status if not provided" do
      subscription_info = {
                            user_id: @user.id,
                            subscription_id: @subscription.id
                          }

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      put '/api/v1/subscription', headers: headers, params: subscription_info.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")

      subscription_json = JSON.parse(response.body, symbolize_names: true)

      expect(subscription_json).to be_a(Hash)
      expect(subscription_json[:data]).to be_a(Hash)
      expect(subscription_json[:data].keys).to eq([:id, :type, :attributes])
      expect(subscription_json[:data][:id]).to be_a(String)
      expect(subscription_json[:data][:type]).to eq('user_subscription')
      expect(subscription_json[:data][:attributes].count).to eq(3)
      expect(subscription_json[:data][:attributes].keys).to eq([:user_id, :subscription_id, :active])
      expect(subscription_json[:data][:attributes][:active]).to eq(true)
      expect(subscription_json[:data][:attributes][:user_id]).to eq(@user.id)
      expect(subscription_json[:data][:attributes][:subscription_id]).to eq(@subscription.id)

    end
  end
end
